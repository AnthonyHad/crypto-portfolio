class AddColumnsToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :api_id, :string
    add_column :coins, :symbol, :string
    add_column :coins, :type, :string
    add_column :coins, :rank, :integer
  end
end
