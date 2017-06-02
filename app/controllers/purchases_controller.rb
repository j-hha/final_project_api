require 'date'

class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :update, :destroy]
  # before_action :authenticate_token

  # GET /purchases
  def index
    @purchases = Purchase.where(user_id: get_current_user.id.to_i)

    render json: @purchases
  end

  # GET /purchases/finances
  def finances
    user = get_current_user.id
    coffee = Purchase.joins(:servings).where(purchases: {by_cup: true, user_id: user}, servings: {user_id: user, beverage_type: 'black coffee'}).average(:price).to_f
    cappuccino = Purchase.joins(:servings).where(purchases: {by_cup: true, user_id: user}, servings: {user_id: user, beverage_type: 'cappuccino'}).average(:price).to_f

    purchases_stats = {
      'total' => {
        'by_cup' => { count: 0, average_price: 0 },
        'by_bag' => { count: 0, average_price: 0 }
      },
      'past_month' => {
          'by_cup' => { count: 0, average_price: 0 },
          'by_bag' => { count: 0, average_price: 0 }
      }
    }

    # total num of purchases by cup
    purchases_stats['total']['by_cup']['count'] = Purchase.where({by_cup: true, user_id: user}).count
    # average price paid
    purchases_stats['total']['by_cup']['average_price'] = Purchase.where({by_cup: true, user_id: user}).average(:price).to_f

    # num of purchases by cup in the past month
    purchases_stats['past_month']['by_cup']['count'] = Purchase.where({by_cup: true, user_id: user, date: Date.today.prev_month..Date.today}).count
    #average price paid
    purchases_stats['past_month']['by_cup']['average_price'] = Purchase.where({by_cup: true, user_id: user, date: Date.today.prev_month..Date.today}).average(:price).to_f

    #total num of purchases by bag
    purchases_stats['total']['by_bag']['count'] = Purchase.where({by_cup: false, user_id: user}).count
    #average price paid
    purchases_stats['total']['by_bag']['average_price'] = Purchase.where({by_cup: false, user_id: user}).average(:price).to_f

    # num of purchases by bag in the past month
    purchases_stats['past_month']['by_bag']['count'] = Purchase.where({by_cup: false, user_id: user, date: Date.today.prev_month..Date.today}).count
    #average price paid
    purchases_stats['past_month']['by_bag']['average_price'] = Purchase.where({by_cup: false, user_id: user, date: Date.today.prev_month..Date.today}).average(:price).to_f

    if (coffee && cappuccino && purchases_stats)
      render json: { status: 200, coffee_average: coffee, cappuccino_average: cappuccino, stats: purchases_stats }
    else
      render json: average_price.errors, status: :unprocessable_entity
    end
  end

  # # GET /purchases/1
  # def show
  #   render json: @purchase
  # end

  # POST /purchases
  def create
    @purchase = Purchase.new(
    date: purchase_params[:date],
    brand: purchase_params[:brand],
    by_cup: purchase_params[:by_cup],
    fair_trade: purchase_params[:fair_trade],
    price: purchase_params[:price],
    rating: purchase_params[:rating],
    # check who the currently logged in user is
    user_id: get_current_user.id)

    if @purchase.save
      render json: {status: 201, purchase: @purchase}
    else
      puts @purchase.error
      render json: {status: 422, message: 'Unprocessable Entity'}
    end
  end

  # # PATCH/PUT /purchases/1
  # def update
  #   if @purchase.update(purchase_params)
  #     render json: @purchase
  #   else
  #     render json: @purchase.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /purchases/1
  def destroy
    # find ALL servings associated with this purchase and delete them
    all_servings = Serving.where(purchase_id: @purchase.id)
    puts "all servings associated with this purchase: #{all_servings}"
    all_servings.destroy_all
    puts "deleted servings"
    @purchase.destroy
    puts "deleted purchase"
    render json: {status: 204, purchase: @purchase}
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
