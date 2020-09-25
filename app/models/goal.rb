# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  expired    :boolean
#  goal       :integer
#  progress   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
end
