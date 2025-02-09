class Manufacture < ApplicationRecord
    has_one :contract
    validates :name, presence: true
end
  