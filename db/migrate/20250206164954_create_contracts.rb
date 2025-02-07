class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts do |t|
      t.string :name
      t.text :description
      t.date :contract_date

      t.timestamps
    end
  end
end
