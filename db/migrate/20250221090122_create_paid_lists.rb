class CreatePaidLists < ActiveRecord::Migration[7.1]
  def change
    create_table :paid_lists, charset: "utf8mb4", collation: "utf8mb4_unicode_ci" do |t|
      t.references :contract, null: false, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2, null: false, default: 0
      t.date :paid_date, null: false

      t.timestamps
    end
  end
end

