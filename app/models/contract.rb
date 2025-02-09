class Contract < ApplicationRecord
    belongs_to :manufacture, optional: true
    validates :contract_no, presence: true
end
