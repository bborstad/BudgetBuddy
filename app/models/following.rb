# == Schema Information
#
# Table name: followings
#
#  id                :bigint           not null, primary key
#  tfalse            :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  following_user_id :bigint
#  requester_user_id :bigint
#
class Following < ApplicationRecord
end
