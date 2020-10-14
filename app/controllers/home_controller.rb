class HomeController < ApplicationController
  def index
    @user = current_user
    @goals = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @posts = Post.all.order(created_at: :desc)
  end

  def terms
  end

  def privacy
  end
end
