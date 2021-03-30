require "application_system_test_case"

class CoinsTest < ApplicationSystemTestCase
  test "visiting the Coin index" do
    visit root_url

    assert_selector "h1", text: "Are we mooning today?🚀"
  end
end
