class CalculateDebtsController < ApplicationController
  before_action :set_calculate_debt, only: [:show, :edit, :update, :destroy]

  # GET /calculate_debts
  # GET /calculate_debts.json
  def index
    @calculate_debts = CalculateDebt.all
  end

  # GET /calculate_debts/1
  # GET /calculate_debts/1.json
  def show
  end

  # GET /calculate_debts/new
  def new
    @calculate_debt = CalculateDebt.new
  end

  # GET /calculate_debts/1/edit
  def edit
    @calculate_debt = CalculateDebt.find(params[:id])
  end

  # POST /calculate_debts
  # POST /calculate_debts.json
  def create
    @calculate_debt = CalculateDebt.new(calculate_debt_params)

    respond_to do |format|
      if @calculate_debt.save
        format.html { redirect_to @calculate_debt, notice: 'Calculate debt was successfully created.' }
        format.json { render :show, status: :created, location: @calculate_debt }
      else
        format.html { render :new }
        format.json { render json: @calculate_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculate_debts/1
  # PATCH/PUT /calculate_debts/1.json
  def update
    respond_to do |format|
      if @calculate_debt.update(calculate_debt_params)
        format.html { redirect_to @calculate_debt, notice: 'Calculate debt was successfully updated.' }
        format.json { render :show, status: :ok, location: @calculate_debt }
      else
        format.html { render :edit }
        format.json { render json: @calculate_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculate_debts/1
  # DELETE /calculate_debts/1.json
  def destroy
    @calculate_debt.destroy
    respond_to do |format|
      format.html { redirect_to calculate_debts_url, notice: 'Calculate debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculate_debt
      @calculate_debt = CalculateDebt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calculate_debt_params
      params.require(:calculate_debt).permit(:principle, :rate, :monthly_payements, :compounds_per_year, :number_of_year, :email, :select)
    end
end
