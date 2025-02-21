class PaidList < ApplicationRecord
    belongs_to :contract
  
    validates :amount, numericality: { greater_than: 0 }
    validates :paid_date, presence: true
  
    def formatted_amount
      ActiveSupport::NumberHelper.number_to_currency(amount, unit: "", delimiter: ",", precision: 2)
    end
  end
  