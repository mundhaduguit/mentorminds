class IndustryCategoriesController < ApplicationController
  before_action :set_industry_category, only: [:show, :edit, :update, :destroy]

  # GET /industry_categories
  # GET /industry_categories.json
  def index
    @industry_categories = IndustryCategory.where("parent_id = ?", 0)
  end

  # GET /industry_categories/1
  # GET /industry_categories/1.json
  def show
    @industry_sub_categories = IndustryCategory.where("parent_id = ?", params[:id])
  end
  def get_company_challenges

  end
  # GET /industry_categories/new
  def new
    @industry_category = IndustryCategory.new
  end

  # GET /industry_categories/1/edit
  def edit
  end

  # POST /industry_categories
  # POST /industry_categories.json
  def create
    @industry_category = IndustryCategory.new(industry_category_params)

    respond_to do |format|
      if @industry_category.save
        format.html { redirect_to @industry_category, notice: 'Industry category was successfully created.' }
        format.json { render :show, status: :created, location: @industry_category }
      else
        format.html { render :new }
        format.json { render json: @industry_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_categories/1
  # PATCH/PUT /industry_categories/1.json
  def update
    respond_to do |format|
      if @industry_category.update(industry_category_params)
        format.html { redirect_to @industry_category, notice: 'Industry category was successfully updated.' }
        format.json { render :show, status: :ok, location: @industry_category }
      else
        format.html { render :edit }
        format.json { render json: @industry_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_categories/1
  # DELETE /industry_categories/1.json
  def destroy
    @industry_category.destroy
    respond_to do |format|
      format.html { redirect_to industry_categories_url, notice: 'Industry category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_category
      @industry_category = IndustryCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industry_category_params
      params.require(:industry_category).permit(:name, :description, :parent_id, :image)
    end
end
