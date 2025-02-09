class AddManufactureToContracts < ActiveRecord::Migration[7.1]
  def change
    add_reference :contracts, :manufacture, null: false, foreign_key: true
  end
end
