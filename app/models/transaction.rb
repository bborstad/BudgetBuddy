class Transaction < ApplicationRecord
    validates :date, presence: true
    validates :amount, presence: true
end
