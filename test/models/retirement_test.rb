# == Schema Information
#
# Table name: retirements
#
#  id                  :bigint           not null, primary key
#  annual_savings      :decimal(, )
#  inital_savings      :decimal(, )
#  intrest_rate        :float
#  retirement_estimate :decimal(, )
#  year_of_retirement  :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint
#
# Indexes
#
#  index_retirements_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class RetirementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
