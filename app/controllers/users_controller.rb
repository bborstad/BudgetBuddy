class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def search
    @users = User.where("first_name || ' ' || last_name ILIKE ?", "%"+params[:q]+"%")
  end


  def show 
    @user = User.find(params[:id])
    @goals = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @posts = Post.where(user_id:@user.id).order(created_at: :desc)
  end 




end
