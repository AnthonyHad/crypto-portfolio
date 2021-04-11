require 'test_helper'

class InvestmentTest < ActiveSupport::TestCase
  test "will not create an investment without the coin price" do
    investment = Investment.new
    assert_not  investment.save
  end
end
