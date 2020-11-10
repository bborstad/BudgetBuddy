class FollowingsController < ApplicationController
  before_action :authenticate_user!

  # GET /followings
  # GET /followings.json
  def index
    theId = params[:id]
    @user = User.find(theId)
    @following = Follow.where(requestor:theId).pluck(:following)
    end

end
