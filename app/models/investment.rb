class Investment < ApplicationRecord
  before_save {self.symbol = self.symbol.upcase}
  before_save {self.name = self.name.capitalize}


  has_many :user_invs
  has_many :users, through: :user_invs


  validates :name, :symbol, :investment_type, presence: true

  def self.list_coins
    CoingeckoClient::Client.list_coins
  end
  
  def self.stock_lookup(ticker,investment_type)
    client = IEX::Api::Client.new(
    publishable_token: ENV['publishable_token'] ,
    secret_token: ENV['secret_token'],
    endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(name:client.company(ticker).company_name,
          symbol: ticker,
          last_price: client.price(ticker),
          investment_type: investment_type)
      
    rescue => exception
      return nil  
    end       
  end

  def self.crypto_lookup(coin_name,coin_symbol,investment_type, currency='usd')
    price = CoingeckoClient::Client.price(coin_name,currency)

    begin
    new(name:coin_name, 
        symbol:coin_symbol, 
        last_price:price, 
        investment_type:investment_type)
    rescue => exception
      return nil
    end
  end


  def self.new_lookup(investment_name, investment_symbol,investment_type)
    
    if investment_type.eql? "Cryptocurrency"
      return crypto_lookup(investment_name, investment_symbol, investment_type)
    else
      return stock_lookup(investment_symbol,investment_type)
    end
  end


  def self.in_db?(symbol,investment_type)
    where(symbol: symbol).where(investment_type: investment_type).first
  end


end
