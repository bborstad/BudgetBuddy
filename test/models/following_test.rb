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
#  user_id           :bigint
#
# Indexes
#
#  index_followings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
