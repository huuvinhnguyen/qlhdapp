class ChangeContractIdNullableInManufactures < ActiveRecord::Migration[6.0]
  def change
    change_column_null :manufactures, :contract_id, true
  end
end
