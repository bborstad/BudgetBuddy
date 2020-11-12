class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end




  def show 
    @user = User.find(params[:id])
    @goals = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @posts = Post.where(user_id:@user.id).order(created_at: :desc)

    @goalss = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @comments = Comment.where(post_id: @post).order("created_at DESC")

    @user_option = UserOption.new

    @display = UserOption.where(user_id:@user.id).last

  end 




end
