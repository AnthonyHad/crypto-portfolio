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


  test "can create and edit an investment" do
    login_as users(:anthony)
    visit investments_url
    click_on '+Add a transaction'
    select2_open label: 'Coin Name'
    select2_search 'Bitcoin', from: 'Coin Name'
    select2_select 'Bitcoin', from: 'Coin Name'
    fill_in 'Coin price', with: '10000'
    fill_in 'Quantity', with: '2'
    click_on 'Add Transaction'
    find('.fa-exchange-alt').click
    find('.fa-edit ').click
    fill_in 'Coin price', with: '30000'
    fill_in 'Quantity', with: '3'
    click_on 'Add Transaction'
    assert_selector "td", text: "30,000.00$"
  end

  test "can delete an investment" do
    login_as users(:anthony)
    visit investments_url
    click_on '+Add a transaction'
    select2_open label: 'Coin Name'
    select2_search 'Bitcoin', from: 'Coin Name'
    select2_select 'Bitcoin', from: 'Coin Name'
    fill_in 'Coin price', with: '10000'
    fill_in 'Quantity', with: '2'
    click_on 'Add Transaction'
    find('.fa-exchange-alt').click
    find('.fa-trash-alt ').click
    page.accept_alert
    assert_selector "h1", text: "No cryptoasset yet ! What are you waiting for to invest? 🦾"
  end


end
