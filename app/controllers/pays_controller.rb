class PaysController < ApplicationController
require 'payjp'
before_action :setcard
  def index
    # マイページからアクセス
  end

  def new
  end

  def create
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
        redirect_to  users_path
      else
        render :new
      end
    end
  end

  def destroy
    # indexから削除可能にする
  end

  private
  def setcard
    @card = Pay.where(user_id:current_user.id)
  end
  
end
