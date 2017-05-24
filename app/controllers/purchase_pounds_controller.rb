class PurchasePoundsController < ApplicationController
  before_action :set_purchase_pound, only: [:show, :update, :destroy]

  # GET /purchase_pounds
  def index
    @purchase_pounds = PurchasePound.all

    render json: @purchase_pounds
  end

  # GET /purchase_pounds/1
  def show
    render json: @purchase_pound
  end

  # POST /purchase_pounds
  def create
    @purchase_pound = PurchasePound.new(purchase_pound_params)

    if @purchase_pound.save
      render json: @purchase_pound, status: :created, location: @purchase_pound
    else
      render json: @purchase_pound.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchase_pounds/1
  def update
    if @purchase_pound.update(purchase_pound_params)
      render json: @purchase_pound
    else
      render json: @purchase_pound.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_pounds/1
  def destroy
    @purchase_pound.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_pound
      @purchase_pound = PurchasePound.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_pound_params
      params.require(:purchase_pound).permit(:date, :price, :brand, :rating, :fair_trade)
    end
end
