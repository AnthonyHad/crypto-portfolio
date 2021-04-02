require "application_system_test_case"

class InvestmentsTest < ApplicationSystemTestCase

  setup do
    @coin = coins(:Bitcoin)
  end

  test "can create a new investment" do
    login_as users(:anthony)


    visit investments_url

    click_on '+Add a transaction'
    select2_open label: 'Coin Name'
    select2_search 'Bitcoin', from: 'Coin Name'
    select2_select 'Bitcoin', from: 'Coin Name'
    fill_in 'Coin price', with: '10000'
    fill_in 'Quantity', with: '2'
    click_on 'Add Transaction'
    assert_selector "th", text: "Bitcoin BTC"
  end
end
