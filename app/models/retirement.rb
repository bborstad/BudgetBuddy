# == Schema Information
#
# Table name: retirements
#
#  id            :bigint           not null, primary key
#  annual_saving :decimal(, )
#  intrest       :float
#  retire_by     :integer
#  start_amount  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Retirement < ApplicationRecord

    def calculate
        ((self.annual_saving * self.retire_by)+ self.start_amount)*self.intrest
    end


    after_save { self.update(:calculate => ((self.annual_saving * self.retire_by)+ self.start_amount)*self.intrest) }



end
