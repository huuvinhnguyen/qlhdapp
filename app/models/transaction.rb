class Transaction < ApplicationRecord
  belongs_to :payment

  validates :source, inclusion: { in: ['bank', 'personal'] }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def amount
    read_attribute(:amount).to_f || 0.0
  end
  
  def exchange_rate
    read_attribute(:exchange_rate).to_f || 0.0
  end

  before_save :set_default_values

  def set_default_values
    self.amount ||= 0
  end
end

