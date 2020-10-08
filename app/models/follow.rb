# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  following  :bigint
#  requestor  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Follow < ApplicationRecord
end
