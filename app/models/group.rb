# == Schema Information
#
# Table name: groups
#
#  id             :bigint           not null, primary key
#  average        :float            default(0.0)
#  categories_sum :float            default(0.0)
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  budget_id      :bigint
#
# Indexes
#
#  index_groups_on_budget_id  (budget_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_id => budgets.id)
#
class Group < ApplicationRecord
    belongs_to :budget

    has_many :categories, :dependent => :delete_all

    validates :name, presence: true


    def self.update_average
        puts("STARTING TASK")

        ActiveRecord::Base.connection.execute("
        UPDATE public.groups SET categories_sum = t.total_projected  
        FROM  (	SELECT group_id, SUM(projected) as total_projected  
                FROM public.categories  
                GROUP BY group_id  ) AS t  
        WHERE groups.id = t.group_id; ")

        puts("FINISHED FIRST STEP")

        ActiveRecord::Base.connection.execute("
        UPDATE public.groups SET average = t.group_average
        FROM (	SELECT groups.name, AVG(categories_sum) AS group_average
                                FROM public.groups
                                GROUP BY groups.name	) AS t
        WHERE groups.name = t.name; ")

        puts("FINISHED SECOND STEP")
    end

end
