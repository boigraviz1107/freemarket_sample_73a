class OrdersController < ApplicationController
  require 'payjp'

  before_action :set_item
  before_action :authenticate_user!
  before_action :redirect_exhibitor
  before_action :redirect_done_buy

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