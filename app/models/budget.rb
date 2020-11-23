# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  month      :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Budget < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :budgets
    )

    has_many :groups, :dependent => :delete_all
     
    validates :month, presence: true
    validates :year, presence: true
    
    # This function is called from the Budget show page and allows a user to move to the previous budget.
    def previous(current_user)
      Budget.where(user_id:current_user).where('budgets.id < ?', self.id).order('id').last
    end
    
    # This function is called from the Budget show page and allows a user to move to the next budget.
    def next(current_user)
      Budget.where(user_id:current_user).where('budgets.id > ?', self.id).order('id').first
    end
    
end
