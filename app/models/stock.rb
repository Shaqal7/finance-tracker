class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks


  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end


  def self.new_from_lookup(ticker_symbol)
    begin
      #client = IEX::Api::Client.new(publishable_token: 'pk_421b4e44aa2343ba842d88e33280b5bb')
      client = StockQuote::Stock.new(api_key: 'pk_421b4e44aa2343ba842d88e33280b5bb')
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      #price = strip_commas(looked_up_stock.latest_price)
      new(name: looked_up_stock.company_name,
          ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
    rescue Exception => e
      return e
    end
  end

  def self.strip_commas(number)
    number.gsub(",","")
  end
end
