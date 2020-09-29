require 'test_helper'

class CalculateDebtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  validates :principle, numericality =>{greater_than: 0}
  validates :monthly_payements, numericality =>{greater_than: 0}

end
