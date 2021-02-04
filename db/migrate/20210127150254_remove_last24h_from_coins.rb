class RemoveLast24hFromCoins < ActiveRecord::Migration[6.0]
  def change
    remove_column :coins, :last_24h, :float
  end
end
