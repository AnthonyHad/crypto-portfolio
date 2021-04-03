class Coin < ApplicationRecord
  belongs_to :investment, optional: true

  def self.coin_exists?(coin_name)
    # needs improvement. it is taking too long. Can I use a find method? Improve run time
    coins = Coin.all
    coins.each do |coin|
      if coin.name == coin_name
        return true
      end
    end
    return false
  end

  def self.find_coin(coin_name)
    coins = Coin.all
    coins.each do |coin|
      if coin.name == coin_name
        return coin
      end
    end
  end

  def self.find_top_ten
    coins = Coin.where(rank: 1..10)
    top_10 = []

    coins.each do |coin|
      if coin.rank == 0
        next
      elsif coin.rank <= 10
        top_10 << coin
      end
    end
    return top_10
  end

  def self.update_top_10_market_data
  top_10 = Coin.find_top_ten
    top_10.each do |coin|
      data = get_latest_OHLC(coin.api_id)

      coin.update(
        open: data[0]["open"],
        close: data[0]["close"],
        high: data[0]["high"],
        low: data[0]["low"],
        volume: data[0]["volume"],
        market_cap: data[0]["market_cap"]
        )
    end
  end


  def self.get_latest_OHLC(coin_id)
    url = "https://api.coinpaprika.com/v1/coins/#{coin_id}/ohlcv/latest/"
    serialized = URI.open(url).read
    parsed = JSON.parse(serialized)
    return parsed
  end
end
