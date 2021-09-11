class Stock < ApplicationRecord


  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    begin
      stock = client.quote(ticker_symbol)#.latest_price
      new(ticker: stock.symbol, name: stock.company_name, last_price: stock.latest_price)
    rescue => exception
      return nil
    end

  end
end
