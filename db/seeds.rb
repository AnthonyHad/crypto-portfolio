require 'json'
require 'open-uri'

def get_active_coins
  # Fetch the data and parse it to JSON
  url = 'https://api.coinpaprika.com/v1/coins'
  # Opens the file and reads it to get the data as a string
  serialized = open(url).read
  # Parses data into an array class
  parsed = JSON.parse(serialized)

  active_coins = []
  # checks which coins are active and stores them in an array
  parsed.each do |coin|
    if coin["is_active"]
      active_coins << coin
    end
  end
  puts "Found #{active_coins.count} active coins"
  return active_coins
end

def get_new_coins(coins)
  new_coins = []

  coins.each do |coin|
    if !Coin.coin_exists?(coin["name"])
      new_coins << coin
    end
  end
  puts "Found #{new_coins.count} new coins"
  return new_coins
end

def create_new_coins(new_coins)
  new_coins.each do |coin|
    Coin.create!(name: coin["name"], api_id: coin["id"], symbol: coin["symbol"], coin_type: coin["type"], rank: coin["rank"])
  end
  puts "Done! Created #{new_coins.count} new coins"
end

def get_inactive_coins(active_coins)
  coins = Coin.all.map { |coin| coin.name }
  inactive_coins = []

  active_coins.each do |active_coin|
    inactive_coins << coins.find { |coin| coin != active_coin["name"]}
  end

  puts "Found #{inactive_coins.count} inactive coins"
  return inactive_coins # this returns an array of inactive coin names strings
end

def update_rankings(active_coins, inactive_coins)
  counter = 0

  if inactive_coins.count != 0
    inactive_coins.each do |coin|
      db_coin = Coin.find_coin(coin)
      db_coin.rank = 0
      counter += 1
    end
  end

  active_coins.each do |coin|
    db_coin = Coin.find_coin(coin["name"])
      db_coin.rank = coin["rank"]
      counter += 1
  end

  puts "Done! #{counter} rankings updated"
end

def get_latest_OHLC(coin_id)
  url = "https://api.coinpaprika.com/v1/coins/#{coin_id}/ohlcv/latest/"
  serialized = open(url).read
  parsed = JSON.parse(serialized)
  return parsed
end

def update_top_10_market_data
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
  puts "Top 10 coins market data updated"
end

puts "Clearing DB"
Investment.destroy_all
Coin.destroy_all # We don't need to delete all coins after they are created. But if we do the logic works the same.
User.destroy_all
puts"Done! Deleted all investments and users"

puts "Seeding!"

puts "Seeding Users"
anthony = User.create!(name: "Anthony", email: "anthony@crypto.com", password: "secret")
puts "Done! Created Anthony"

# Investment_1 = Investment.create!(user_id: anthony.id, coin_id: bitcoin.id, coin_price: 22000, quantity: 0.001234)
# puts "Created one investment"

puts "Seeding Coins"
puts "Getting all active coins"
active_coins = get_active_coins

puts "Looking for new coins"
new_coins = get_new_coins(active_coins)

if new_coins.count > 0
  puts "Creating new coins"
  create_new_coins(new_coins)
end

puts "Looking for inactive coins"
inactive_coins = get_inactive_coins(active_coins)

puts "Updating rankings of all coins"
update_rankings(active_coins, inactive_coins)

puts "Success. #{Coin.all.count} Coins in the database"

puts "Looking for latest market info for top 10 coins"
update_top_10_market_data





