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
#
require 'test_helper'

class CalculateDebtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  validates :principle, numericality =>{greater_than: 0}
  validates :monthly_payements, numericality =>{greater_than: 0}

end
