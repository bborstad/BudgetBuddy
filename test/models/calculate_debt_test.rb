# == Schema Information
#
# Table name: calculate_debts
#
#  id                 :bigint           not null, primary key
#  compounds_per_year :integer
#  email              :string
#  monthly_payements  :decimal(, )
#  number_of_year     :integer
#  principle          :decimal(, )
#  rate               :decimal(, )
#  select             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_calculate_debts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CalculateDebtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  validates :principle, numericality =>{greater_than: 0}
  validates :monthly_payements, numericality =>{greater_than: 0}

end
