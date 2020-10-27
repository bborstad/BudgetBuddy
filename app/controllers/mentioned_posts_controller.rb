class MentionedPostsController < ApplicationController
    before_action :authenticate_user!

    def index

        @mentioned_posts = MentionedPost.where(user_id:current_user)
        @posts = Post.joins(:mentioned_posts).where('mentioned_posts.user_id' => current_user).order(created_at: :desc)
    end


end