class PaysController < ApplicationController

  def index
    # マイページからアクセス
  end

  def new
    # カードを登録画面
  end

  def create
    # カードを登録処理
  end

  def destroy
    pay = Pay.find(params[:id])
    pay.destroy
    redirect_to pays_path
    # indexから削除可能にする
  end





end
