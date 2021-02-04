class RemoveCoinNameFromInvestments < ActiveRecord::Migration[6.0]
  def change
    remove_column :investments, :coin_name, :string
  end
end
