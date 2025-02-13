class AddContractToPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :contract, null: false, foreign_key: true
  end
end
