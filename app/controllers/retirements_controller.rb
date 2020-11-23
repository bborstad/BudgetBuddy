class RetirementsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [:show, :edit, :update, :destroy]
  before_action :set_retirement, only: [:show, :edit, :update, :destroy]

  # GET /retirements
  # GET /retirements.json
  def index
    @retirements = Retirement.where(user_id:current_user)
  
end

  # GET /retirements/1
  # GET /retirements/1.json
  def show
  end

  # GET /retirements/new
  def new
    @retirement = Retirement.new
  end

  # GET /retirements/1/edit
  def edit
    @retirement = Retirement.find(params[:id])
  end

  # POST /retirements
  # POST /retirements.json
  def create
    @retirement = current_user.retirements.new(retirement_params)

    respond_to do |format|
      if @retirement.save
        format.html { redirect_to @retirement, notice: 'Retirement was successfully created.' }
        format.json { render :show, status: :created, location: @retirement }
      else
        format.html { render :new }
        format.json { render json: @retirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retirements/1
  # PATCH/PUT /retirements/1.json
  def update
    respond_to do |format|
      if @retirement.update(retirement_params)
        format.html { redirect_to @retirement, notice: 'Retirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @retirement }
      else
        format.html { render :edit }
        format.json { render json: @retirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retirements/1
  # DELETE /retirements/1.json
  def destroy
    @retirement.destroy
    respond_to do |format|
      format.html { redirect_to retirements_url, notice: 'Retirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retirement
      @retirement = Retirement.find(params[:id])
    end

    #makes sure only the user who created the estimate is the only one who can edit it 
    def require_permission
      if Retirement.find(params[:id]).user != current_user
        redirect_to retirements_url, flash: { error: "You do not have permission to do that."}
      end
    end

    # Only allow a list of trusted parameters through.
    def retirement_params
      params.require(:retirement).permit(:annual_savings, :year_of_retirement, :inital_savings, :intrest_rate, :retirement_estimate)
    end

end
