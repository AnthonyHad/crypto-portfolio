class AddLowToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :low, :float
  end
end
