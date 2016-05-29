class Stock < ActiveRecord::Base
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_lookup(ticker_symbol)
    lookup_stock = StockQuote::Stock.quote(ticker_symbol)
    nil unless lookup_stock.name
    new_stock = new(ticker: lookup_stock.symbol, name: lookup_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end

  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (closing)" if closing_price
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (opening)" if opening_price
    "Unavalilable"
  end
end
