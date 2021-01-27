class AddCloseToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :close, :float
  end
end
