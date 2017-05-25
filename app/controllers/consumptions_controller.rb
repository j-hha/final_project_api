class ConsumptionsController < ApplicationController
  before_action :set_consumption, only: [:show, :update, :destroy]

  # GET /consumptions
  def index
    @consumptions = Consumption.all

    render json: @consumptions
  end

  # GET /consumptions/1
  # def show
  #   render json: @consumption
  # end

  # POST /consumptions
  def create
    @consumption = Consumption.new(consumption_params)

    if @consumption.save
      render json: @consumption, status: :created, location: @consumption
    else
      render json: @consumption.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consumptions/1
  def update
    if @consumption.update(consumption_params)
      render json: @consumption
    else
      render json: @consumption.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consumptions/1
  def destroy
    @consumption.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumption
      @consumption = Consumption.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def consumption_params
      params.require(:consumption).permit(:date, :beverage_type, :size, :cal, :caffeine, :disposable_cup)
    end
end
