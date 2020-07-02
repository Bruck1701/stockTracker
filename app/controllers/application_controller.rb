class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :cripto_currency_list
  
  def crypto_currency_list
    @crypto_currency_list ||= Investment.list_coins
  end



end
