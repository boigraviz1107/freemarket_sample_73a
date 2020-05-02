class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash.now[:alert] = '保存出来ましたよー'
      redirect_to users_path
    else
      flash.now[:alert] = '保存できてませんよー'
      render :new
    end
  end

  private
  def account_params
    params.require(:account).permit(:post_num, :prefecture_id, :city, :city_num, :building, :phone_num).merge(user_id: current_user.id)
  end
end
