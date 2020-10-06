# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  month      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Budget < ApplicationRecord
    has_many :categories, dependent: :destroy
end
