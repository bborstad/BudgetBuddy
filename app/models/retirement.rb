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
#
class Retirement < ApplicationRecord

    before_save :calculate_retirement


    def calculate_retirement

        #get delta time by subtracting the input year - the current year 
        delta_t = self.year_of_retirement - Date.today.year

        # calculation the inital amount 
        cal_with_intital = self.inital_savings * ((1+self.intrest_rate)**delta_t)

        #calculation with the annual amount  
        cal_with_annual = self.annual_savings * (((1+self.intrest_rate)**delta_t)-1)/self.intrest_rate

        #sum those and save to retirement_estimate 
        self.retirement_estimate = (cal_with_annual + cal_with_intital).round(2)



  



    end




end
