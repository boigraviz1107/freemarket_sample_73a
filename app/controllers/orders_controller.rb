class OrdersController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    # 決済とオーダーレコードを追加
  end

end
