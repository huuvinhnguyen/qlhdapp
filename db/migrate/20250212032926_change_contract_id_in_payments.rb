class ChangeContractIdInPayments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :payments, :contract_id, true
  end
end

