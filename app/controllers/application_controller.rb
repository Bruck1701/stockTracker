class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  

  helper_method :cripto_currency_list
  
  def crypto_currency_list
    @crypto_currency_list ||= Investment.list_coins
  end


  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

  end


end
