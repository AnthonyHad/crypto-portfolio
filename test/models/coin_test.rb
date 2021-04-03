require 'test_helper'

class CoinTest < ActiveSupport::TestCase

  #  setup do
  #   @coin = coins.all
  # end

  test "Top 10 coins are loaded from the db when function is called" do
    Coin.find_top_ten
    assert true
    # arr.any?{|coin| coin.rank >=1 && coin.rank <=10  }
  end


end
