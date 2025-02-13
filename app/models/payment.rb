class Payment < ApplicationRecord
    belongs_to :contract, optional: true
    validates :amount, presence: true, numericality: { greater_than: 0 }
    has_many :transactions, dependent: :destroy
    accepts_nested_attributes_for :transactions, allow_destroy: true
    belongs_to :status, optional: true
    def bank_transactions
        transactions.where(source: 'bank')
    end
    
    def personal_transactions
        transactions.where(source: 'personal')
    end

    def add_status(name, type)
        statuses.create(name: name, type: type)
    end
end
