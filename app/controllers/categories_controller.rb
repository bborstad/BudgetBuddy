class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :get_group_and_budget

  # GET /categories
  # GET /categories.json
  def index
    @categories = @groups.categories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = @group.categories.build
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @group.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to budget_path(@budget), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to budget_path(@budget), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to budget_path(@budget), notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      # @category = @group.categories.find(params[:id])
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :projected, :actual)
    end

    # Find the budget and group that a category belongs to.
    def get_group_and_budget
      @budget = Budget.find(params[:budget_id])
      @group = Group.find(params[:group_id])
    end

    # Require that the owner of the resource is the current user.
    def require_permission
      if Budget.find(params[:budget_id]).user != current_user
        redirect_to goals_url, flash: { error: "You do not have permission to do that."}
      end
    end
end
