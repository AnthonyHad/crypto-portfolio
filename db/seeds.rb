# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing DB"
Investment.destroy_all
Coin.destroy_all
User.destroy_all
puts"done!"

puts"Seeding!"

anthony = User.create!(name: "Anthony", email: "anthony@crypto.com", password: "secret")
puts "Created Anthony"

# Investment_1 = Investment.create!(user_id: anthony.id, coin_id: bitcoin.id, coin_price: 22000, quantity: 0.001234)
# puts "Created one investment"

Coin.create!(name: "Bitcoin", open: 34312.34, close: 30127.34, high: 35000, low: 29300, volume: 200000000, market_cap: 503000000)

Coin.create!(name: "Ethereum", open: 1700.34, close: 1723.12, high: 1750.1, low: 1700.08, volume: 40000000, market_cap: 300000000)

puts "done!"