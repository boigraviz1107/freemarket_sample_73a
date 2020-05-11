class SignupController < ApplicationController

  def step1
    @user = User.new(session[:user_params])
    session[:user_params].clear if session[:user_params]
    session[:account_params].clear if session[:account_params]
  end

  def save_step1_to_session
    user = User.new(user_params)
    session[:user_params] = user_params
    if user.valid?
      redirect_to step2_signup_index_path
    else
      redirect_to step1_signup_index_path, flash: { notice: user.errors.full_messages }
    end
  end

  def step2
    @account = Account.new(session[:account_params])
    session[:account_params].clear if session[:account_params]
  end

  def complete_signup
    user = User.new(session[:user_params])
    account = user.build_account(account_params)
    if account.valid? && user.valid?
      user.save
      account.save
      sign_in(:user, user)
      session[:user_params].clear
      redirect_to users_path, flash: { notice: "アカウント作成しました" }
    else
      session[:account_params] = account_params
      redirect_to step2_signup_index_path, flash: { notice: account.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :birth_date,
      :first_name,
      :last_name,
      :first_name_hira,
      :last_name_hira,
    )
  end

  def account_params
    params.require(:account).permit(
      :post_num,
      :prefecture_id,
      :city,
      :city_num,
      :building,
      :phone_num,
    )
  end
end