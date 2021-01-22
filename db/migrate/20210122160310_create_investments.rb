class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coin, null: false, foreign_key: true
      t.float :coin_price
      t.float :quantity
      t.date :created

      t.timestamps
    end
  end
end
