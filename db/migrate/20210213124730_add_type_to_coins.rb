class AddTypeToCoins < ActiveRecord::Migration[6.0]
  def change
    rename_column :coins, :type, :coin_type
  end
end
