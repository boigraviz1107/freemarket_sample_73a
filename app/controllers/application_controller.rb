class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_date, :last_name, :first_name, :last_name_hira, :first_name_hira])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def after_sign_in_path_for(resource)
    new_account_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def production?
    Rails.env.production?
  end
end

