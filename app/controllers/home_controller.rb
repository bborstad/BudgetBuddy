class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @user = current_user
    @goals = Goal.where(user_id:@user.id).order(ppercent: :asc)

    @userlist = Follow.where(:requestor => @current_user.id).pluck(:following)
    @userlist.push( @current_user.id)
    @posts = Post.where(user_id:@userlist).order(created_at: :desc)
    
    @goalss = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @comments = Comment.where(post_id: @post).order("created_at DESC")

    
  end

  def terms
  end

  def privacy
  end
end
