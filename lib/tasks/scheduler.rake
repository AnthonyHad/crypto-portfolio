desc "This task is called by the Heroku scheduler add-on"
task :update_top_10 => :environment do
  puts "Updating top 10 coins..."
  Coin.update_top_10_market_data
  puts "done."
end
