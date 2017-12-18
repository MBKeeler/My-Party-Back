class BeveragesController < ApplicationController
  before_action :set_beverage, only: [:show, :update, :destroy]

  # GET /beverages
  def index
    @beverages = Beverage.all

    render json: @beverages
  end

  # GET /beverages_by occasion
  def indexbyoccasion
    @beverages = Beverage.find_each(params[:occasion])

    render json: @beverages
  end

  # GET /beverages/1
  def show
    render json: @beverage
  end

  # POST /beverages
  def create
    @beverage = Beverage.new(beverage_params)

    if @beverage.save
      render json: @beverage, status: :created, location: @beverage
    else
      render json: @beverage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /beverages/1
  def update
    if @beverage.update(beverage_params)
      render json: @beverage
    else
      render json: @beverage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beverages/1
  def destroy
    @beverage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beverage
      @beverage = Beverage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def beverage_params
      params.require(:beverage).permit(:name, :description, :recipe, :rating, :occasion)
    end
end
