class AddVolumeToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :volume, :float
  end
end
