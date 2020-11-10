class FollowersController < ApplicationController
  before_action :authenticate_user!

  # GET /followers
  # GET /followers.json
  def index
    theId = params[:id]
    @followers = Follow.where(following:theId).pluck(:requestor)
  end

end
