class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.text :description
      t.decimal :amount
      t.date :payment_date

      t.timestamps
    end
  end
end
