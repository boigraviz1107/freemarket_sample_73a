class OrdersController < ApplicationController
  require 'payjp'

  before_action :set_item
  before_action :authenticate_user!
  before_action :redirect_exhibitor
  before_action :redirect_done_buy

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params_order)
    item = @order.item_id
    card = Pay.find_by(user_id: cirrent_user_id, card_id: params[:card_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::charge.create(amount: item[:price], customer: card.custmor_id, currency: 'JPY')
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