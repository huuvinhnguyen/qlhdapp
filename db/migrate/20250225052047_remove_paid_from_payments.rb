class RemovePaidFromPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :paid, :bigint
  end
end
