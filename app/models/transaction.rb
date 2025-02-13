class Transaction < ApplicationRecord
  belongs_to :payment

  validates :source, inclusion: { in: ['bank', 'personal'] }
end

