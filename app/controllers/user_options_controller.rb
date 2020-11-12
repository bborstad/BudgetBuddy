class UserOptionsController < ApplicationController
  before_action :set_user_option, only: [:show, :edit, :update, :destroy]

  # GET /user_options
  # GET /user_options.json
  def index
    @user_options = UserOption.all
  end

  # GET /user_options/1
  # GET /user_options/1.json
  def show
  end

  # GET /user_options/new
  def new
    @user_option = UserOption.new
  end

  # GET /user_options/1/edit
  def edit
  end

  # POST /user_options
  # POST /user_options.json
  def create
    @user_option = current_user.user_options.build(user_option_params)
    respond_to do |format|
      if @user_option.save
        format.html { redirect_back fallback_location: root_path, notice: 'User option was successfully created.' }
        format.json { render :show, status: :created, location: @user_option }
      else
        format.html { render :new }
        format.json { render json: @user_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_options/1
  # PATCH/PUT /user_options/1.json
  def update
    respond_to do |format|
      if @user_option.update(user_option_params)
        format.html { redirect_back fallback_location: root_path, notice: 'User option was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_option }
      else
        format.html { render :edit }
        format.json { render json: @user_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_options/1
  # DELETE /user_options/1.json
  def destroy
    @user_option.destroy
    respond_to do |format|
      format.html { redirect_to user_options_url, notice: 'User option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_option
      @user_option = UserOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_option_params
      params.require(:user_option).permit(:budget_id)
    end
end
