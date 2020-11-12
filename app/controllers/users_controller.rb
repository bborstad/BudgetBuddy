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

    @goalss = Goal.where(user_id:@user.id).order(ppercent: :asc)
    @comments = Comment.where(post_id: @post).order("created_at DESC")

    @user_option = UserOption.find_or_create_by(user_id: current_user.id)

    @display = UserOption.where(user_id:@user.id).last

  end 




end
