class Contract < ApplicationRecord
    belongs_to :manufacture, optional: true
    has_many :payments
    validates :contract_no, presence: true
end