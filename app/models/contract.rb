class Contract < ApplicationRecord
    belongs_to :manufacture, optional: true
    has_many :payments, dependent: :destroy
    has_many :paid_lists, dependent: :destroy
    validates :contract_no, presence: true

    def total_paid
        paid_lists.sum(:amount)
    end

    def total_paid_up_to(payment_date)
        paid_lists.where("paid_date <= ?", payment_date).sum(:amount)
    end
end