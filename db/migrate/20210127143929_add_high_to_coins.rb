class AddHighToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :high, :float
  end
end
