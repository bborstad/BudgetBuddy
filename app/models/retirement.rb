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
class Retirement < ApplicationRecord



    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :retirements
    )

    before_save :calculate_retirement
    validates :intrest_rate, numericality: {greater_than_or_equal_to: 0}
    validates :inital_savings, numericality: {greater_than_or_equal_to: 0}
    validates :annual_savings, numericality: {greater_than_or_equal_to: 0}





    def calculate_retirement
        ratei=self.intrest_rate* 0.01

        #get delta time by subtracting the input year - the current year 
        delta_t = self.year_of_retirement - Date.today.year

        # calculation the inital amount 
        cal_with_intital = self.inital_savings * ((1+ratei)**delta_t)

        #calculation with the annual amount  
        cal_with_annual = self.annual_savings * (((1+ratei)**delta_t)-1)/ratei

        #sum those and save to retirement_estimate 
        self.retirement_estimate = (cal_with_annual + cal_with_intital).round(2)



  



    end




end
