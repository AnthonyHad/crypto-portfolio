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
    coins = Coin.all
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
end
