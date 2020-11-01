# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  attachid   :integer          default(0)
#  attachment :string
#  attachtype :integer          default(0)
#  budgetid   :integer          default(0)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
    before_create :attach_value
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
    )


    has_many :likes, dependent: :destroy
    has_many :mentioned_posts, dependent: :destroy
    has_rich_text :content
    

    after_create :send_notifications
    #after_create :add_mentioned

    def send_notifications
        users = user_mentions - [user]
        users.each do |user|
            PostMailer.user_mention(self, user).deliver_now
            puts(user.id)
            @mentioned_post = MentionedPost.create(user_id: user.id, post_id: self.id)
        end
     end

    def add_mentioned
        users = user_mentions - [user]
        users.each do |user|
            @mentioned_user = mentioned_user.create(user_id: user.id, post_id: self.id)
        end
    end

    def user_mentions
        @users ||= content.body.attachments.select{ |a| a.attachable.class == User }.map(&:attachable).uniq       
    end

    def attach_value
        if self.attachtype == 0
            self.attachid = 0
        end
    end




end
