class OrdersController < ApplicationController

  def new
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order = Order.new(params_order)
      if @order.save
        flash[:notice] = "購入が完了しました"
        redirect_to root_path
      else
        session[:order] = @order
        redirect_to new_item_order_path, flash: { errors: @order.errors.full_messages }
      end
  end

  private

  def params_order
    params.require(:order).permit(:item_id).merge(user_id: current_user.id)
  end

end