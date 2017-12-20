# frozen_string_literal: true

class BeveragesController < ProtectedController
#class BeveragesController < ApplicationController

  before_action :set_beverage, only: [:show, :update, :destroy, :index_user_beverages]

  # GET /beverages
  def index
    @beverages = Beverage.all

    render json: @beverages
  end

  # GET /beverages/1
  def show
    # changed below on recommendation from Tingh
    # @beverage = current_user.beverages.find(params[:id])
    @beverage = Beverage.find(params[:id])
    render json: @beverage
  end

  # GET / only user's beverages
  def index_user_beverages
    # @beverages = User.find(params[:id]).beverages.find(:all)
    # @beverages = current_user.find(params[:id]).beverages.find(:all)
    @beverages = current_user.beverages.find(:all)
    render json: @beverages
  end

  # GET /beverages_by occasion
  def index_by_occasion
    @beverages = Beverage.find(params[:occasion])

    render json: @beverages
  end

  # POST /beverages
  def create
    # @beverage = Beverage.new(beverage_params)
    @beverage = current_user.beverages.build(beverage_params)

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
      # @beverage = Beverage.find()
      # @beverages = Beverage.find(:all)
      # @beverage = Beverages.find(params[:id])
      # may need to set below back to make update work
      @beverage = current_user.beverages.find(params[:id])

    end

    # Only allow a trusted parameter "white list" through.
    def beverage_params
      params.require(:beverage).permit(:name, :description, :recipe, :rating, :occasion)
    end
end
