class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_permission, only: [:show, :edit, :update, :destroy]

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.where(user_id:current_user)
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = current_user.follows.new(follow_params)

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to @follow, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def find_follow
    @follow = Follow.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.permit(:requestor, :following)
    end
    def require_permission
      if Follow.find(params[:id]).user != current_user
        redirect_to goals_url, flash: { error: "You do not have permission to do that."}
      end
    end
end
