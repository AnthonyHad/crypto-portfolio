require "application_system_test_case"

class InvestmentsTest < ApplicationSystemTestCase
  test "visiting the  Investment index" do
    login_as users(:anthony)

    visit investments_url

    click_on '+Add a transaction'
    within("select2-search__field") do
      fill_in 'Coin', with: 'Bitcoin'
    end
    save_and_open_screenshot
    fill_in 'Coin price', with: '10000'
    fill_in 'Quantity', with: '2'
    click_on 'Add Transaction'


    assert_selector "h3", text: "Your Crypto Assets🪙"

  end
end
