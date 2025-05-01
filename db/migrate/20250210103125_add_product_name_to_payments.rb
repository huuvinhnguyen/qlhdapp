class AddProductNameToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :product_name, :string
  end
end
