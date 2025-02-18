class AddQuantityAndPriceToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :quantity, :integer
    add_column :payments, :price, :decimal
  end
end
