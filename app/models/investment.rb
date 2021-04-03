require 'json'
require 'open-uri'

class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :coin



  def self.update_coin_data
  investments = Investment.all
  investments.each do |investment|
    url = "https://api.coinpaprika.com/v1/coins/#{investment.coin_id}/ohlcv/latest/"
    serialized = URI.open(url).read
    parsed = JSON.parse(serialized)

    investment.coin.update(
      open: parsed[0]["open"],
      close: parsed[0]["close"],
      high: parsed[0]["high"],
      low: parsed[0]["low"],
      volume: parsed[0]["volume"],
      market_cap: parsed[0]["market_cap"]
      )
    end
   end
end
