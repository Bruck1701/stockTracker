class Crypto < ApplicationRecord

  def self.new_lookup(coin_name,currency='usd')
    CoingeckoClient::Client.price(coin_name,currency)
    
  end



end
