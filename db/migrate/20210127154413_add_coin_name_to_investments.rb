class AddCoinNameToInvestments < ActiveRecord::Migration[6.0]
  def change
    add_column :investments, :coin_name, :string
  end
end
