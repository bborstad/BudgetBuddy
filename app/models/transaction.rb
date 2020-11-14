class Transaction < ApplicationRecord
    belongs_to :user

    validates :date, presence: true
    validates :amount, presence: true
end
