class PurchaseCupsController < ApplicationController
  before_action :set_purchase_cup, only: [:show, :update, :destroy]

  # GET /purchase_cups
  def index
    @purchase_cups = PurchaseCup.all

    render json: @purchase_cups
  end

  # GET /purchase_cups/1
  def show
    render json: @purchase_cup
  end

  # POST /purchase_cups
  def create
    @purchase_cup = PurchaseCup.new(purchase_cup_params)

    if @purchase_cup.save
      render json: @purchase_cup, status: :created, location: @purchase_cup
    else
      render json: @purchase_cup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchase_cups/1
  def update
    if @purchase_cup.update(purchase_cup_params)
      render json: @purchase_cup
    else
      render json: @purchase_cup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_cups/1
  def destroy
    @purchase_cup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_cup
      @purchase_cup = PurchaseCup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_cup_params
      params.require(:purchase_cup).permit(:date, :price, :brand, :rating, :fair_trade)
    end
end
