class RemoveLatestPriceFromCoins < ActiveRecord::Migration[6.0]
  def change
    remove_column :coins, :latest_price, :float
  end
end
