class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end




  def show 
    @user = User.find(params[:id])
    @goals = Goal.where(user_id:@user.id).order(created_at: :desc)
    @posts = Post.where(user_id:@user.id).order(created_at: :desc)

  end 




end
