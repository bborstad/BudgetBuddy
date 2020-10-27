# == Schema Information
#
# Table name: mentioned_posts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class MentionedPost < ApplicationRecord
    belongs_to :post
end
