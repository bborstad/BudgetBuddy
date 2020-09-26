# == Schema Information
#
# Table name: retirements
#
#  id                    :bigint           not null, primary key
#  annual_savings        :decimal(, )
#  intrest_rate          :float
#  retirement_estimate   :decimal(, )
#  start_amount          :decimal(, )
#  time_until_retirement :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Retirement < ApplicationRecord
end
