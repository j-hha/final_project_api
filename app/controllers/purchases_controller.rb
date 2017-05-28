class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :update, :destroy]
  # before_action :authenticate_token

  # GET /purchases
  def index
    @purchases = Purchase.all

    render json: @purchases
  end

  # GET /purchases/1
  def show
    render json: @purchase
  end

  # POST /purchases
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase[:user_id] = 2

    if @purchase.save
      render json: {status: 201, purchase: @purchase}
    else
      puts @purchase.error
      render json: {status: 422, message: 'Unprocessable Entity'}
    end
  end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params.require(:purchase).permit(:by_cup, :date, :price, :brand, :rating, :fair_trade)
    end
end
