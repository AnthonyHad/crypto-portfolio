class Coin < ApplicationRecord
  belongs_to :investment, optional: true

  def self.coin_exists?(coin_name)
    coins = Coin.all
    coins.each do |coin|
      if coin.name == coin_name
        return false
      end
    end
    return true
  end
end
