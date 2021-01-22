class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.float :latest_price
      t.float :last_24h

      t.timestamps
    end
  end
end
