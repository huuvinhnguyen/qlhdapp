class Payment < ApplicationRecord
    belongs_to :contract, optional: true
    has_many :transactions, dependent: :destroy
    accepts_nested_attributes_for :transactions, allow_destroy: true
    belongs_to :status, optional: true

    validates :quantity, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :price, numericality: { greater_than: 0 }, allow_nil: true
    def bank_transactions
        transactions.where(source: 'bank')
    end
    
    def personal_transactions
        transactions.where(source: 'personal')
    end

    def add_status(name, type)
        statuses.create(name: name, type: type)
    end

    def quantity
        read_attribute(:quantity).to_i || 0
    end

    def price
        read_attribute(:price).to_f || 0.0
    end
end
