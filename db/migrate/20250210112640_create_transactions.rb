class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :payment, null: false, foreign_key: true
      t.string :source
      t.bigint :amount
      t.decimal :exchange_rate
      t.bigint :vnd_value

      t.timestamps
    end
  end
end
