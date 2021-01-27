class AddOpenToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :open, :float
  end
end
