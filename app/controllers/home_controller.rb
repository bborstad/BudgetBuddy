class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new #new post
    @user = current_user
    @goals = Goal.where(user_id:@user.id).order(ppercent: :asc) #Get users goals

    @userlist = Follow.where(:requestor => @current_user.id).pluck(:following) # get list of follows
    @userlist.push( @current_user.id)
    @posts = Post.where(user_id:@userlist).order(created_at: :desc) #filters posts with users you follow
    
    @goalss = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @comments = Comment.where(post_id: @post).order("created_at DESC") # get comments for post in descending order

    
  end

  def terms
  end

  def privacy
  end
end
