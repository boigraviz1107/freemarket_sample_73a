class OrdersController < ApplicationController
  require 'payjp'

  before_action :set_item, except: %i(cardRegist cardCreate)
  before_action :authenticate_user!, except: %i(cardRegist cardCreate)
  before_action :redirect_exhibitor, except: %i(cardRegist cardCreate)
  before_action :redirect_done_buy, except: %i(cardRegist cardCreate)

  def new
    @order = Order.new
    @cards = []
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Pay.where( user_id: current_user )
    customer.each do |cus|
      card = Payjp::Customer.retrieve("#{cus.customer_id}").cards.data[0]
      @cards << card
    end
  end

  def create
    @order = Order.new(params_order)
    item = Item.find(@order.item_id)
    card = Pay.find_by(params_card_id)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(amount: item.price, customer: card.customer_id, currency: 'JPY')
    if @order.save
      redirect_to root_path, flash: { notice: "購入が完了しました" }
    else
      redirect_to new_item_order_path
    end
  end

  def card_new
    @item = Item.find(params[:item_id])
  end

  def card_create
     Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    if params['payjp-token'].blank?
      render new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
      )
      @card = Pay.create(
        user_id: current_user.id, 
        customer_id: customer.id, 
        card_id: customer.cards.data[0].id
      )
      if @card.save
        redirect_to new_item_order_path(params[:item])
      else
        redirect_to new_item_order_path(params[:item])
      end
    end
  end

  private

  def params_order
    params.require(:order).permit(:item_id).merge(user_id: current_user.id)
  end

  def params_card_id
    params.require(:order).permit(:card_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_exhibitor
    redirect_to users_path if @item.user == current_user
  end

  def redirect_done_buy
    redirect_to root_path if @item.order
  end
end