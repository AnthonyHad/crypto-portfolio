class AddMarketCapToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :market_cap, :float
  end
end
