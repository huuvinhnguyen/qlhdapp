class Contract < ApplicationRecord
    belongs_to :manufacture, optional: true
    validates :name, presence: true
end
