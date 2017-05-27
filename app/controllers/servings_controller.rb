class ServingsController < ApplicationController
  before_action :set_serving, only: [:show, :update, :destroy]
  before_action :authenticate_token


  # GET /servings
  def index
    @servings = Serving.all

    render json: @servings
  end

  # GET /servings/1
  def show
    render json: @serving
  end

  # POST /servings
  def create
    @serving = Serving.new(serving_params)

    if @serving.save
      render json: @serving, status: :created, location: @serving
    else
      render json: @serving.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servings/1
  def update
    if @serving.update(serving_params)
      render json: @serving
    else
      render json: @serving.errors, status: :unprocessable_entity
    end
  end

  # DELETE /servings/1
  def destroy
    @serving.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serving
      @serving = Serving.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def serving_params
      params.require(:serving).permit(:date, :beverage_type, :size, :cal, :caffeine, :sugar_content, :disposable_cup)
    end
end
