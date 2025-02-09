class RenameNameToContractNoInContracts < ActiveRecord::Migration[6.0]
  def change
    rename_column :contracts, :name, :contract_no
  end
end

