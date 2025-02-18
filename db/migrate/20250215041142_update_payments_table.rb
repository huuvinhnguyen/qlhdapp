class UpdatePaymentsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :payments, :amount, :bigint # Xóa cột amount
    add_column :payments, :paid, :bigint, default: 0, null: false # Thêm cột paid với default = 0
  end
end
