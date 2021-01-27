# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Anthony = User.create(name: "Anthony", email: "anthony@crypto.com", password: "secret")

Bitcoin = Coin.create(name: "Bitcoin", open: 34312.34, close: 30127.34, high: 35000, low: 29300, volume: 200000000, market_cap: 503000000)
