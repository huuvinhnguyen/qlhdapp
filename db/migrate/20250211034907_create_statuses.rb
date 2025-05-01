class CreateStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :status_type  # Đổi 'type' thành 'status_type'

      t.timestamps
    end

    add_reference :payments, :status, foreign_key: true  # Thêm status_id vào bảng payments
  end
end
