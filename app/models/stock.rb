class Stock < ApplicationRecord



  def self.new_lookup(ticker)
      client = IEX::Api::Client.new(
      publishable_token: ENV['publishable_token'] ,
      secret_token: ENV['secret_token'],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticker)
  end


end
