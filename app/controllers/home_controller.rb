class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @user = current_user
    @goals = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def terms
  end

  def privacy
  end
end
