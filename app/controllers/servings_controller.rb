class ServingsController < ApplicationController
  before_action :set_serving, only: [:show, :update, :destroy]
  # before_action :authenticate_token


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
    # save params for beverage_type to variable
    user_input = serving_params[:beverage_type]

    # check who the currently logged in user is
    consumer = get_current_user

    # method for calculating correct values based on user's choice of beverage
    def calculate_values(db_entry, multiplicator)
      newHash = {}
      db_entry.each do |key, value|
        if value.is_a?(Float)
          newHash[key] = value * multiplicator
        end
      end
      return newHash
    end

    # method for combining two ingredients
    def combine_values(itemOne, itemTwo)
      newHash = {}
      itemOne.each do |keyOne, valueOne|
        itemTwo.each do |keyTwo, valueTwo|
          if keyOne == keyTwo && valueOne.is_a?(Float) && valueTwo.is_a?(Float)
            newHash[keyOne] = valueOne + valueTwo
          end
        end
      end
      return newHash
    end

    #initialize variable
    beverage = {}
    # will look up ingredients in nutrients table based on user input for beverage_type
    case user_input
    when 'cappuccino'
      # find ingredients in database: expresso and whole milk
      espresso = Nutrient.find_by(beverage_type: 'espresso').as_json
      whole_milk = Nutrient.find_by(beverage_type:'whole_milk').as_json
      # calculate values for Italian style capp --> 25ml expresso + 100ml whole milk and save them in capp hash
      beverage = combine_values(calculate_values(espresso, 0.85), calculate_values(whole_milk, 3.4))
      puts 'cappuccino:'
      puts beverage
    when 'black coffee'
      # find ingredients in db
      coffee = Nutrient.find_by(beverage_type: 'black_coffee').as_json
      # calculate correct values
      beverage = calculate_values(coffee, 8)
      puts 'cup of black coffee'
      puts beverage
    when 'espresso'
      # find ingredients in db
      espresso = Nutrient.find_by(beverage_type: 'espresso').as_json
      # calculate correct values
      beverage = calculate_values(espresso, 0.85)
      puts 'cup of espresso'
      puts beverage
    when 'instant coffee'
      # find ingredients in db
      instant_coffee = Nutrient.find_by(beverage_type: 'instant_coffee').as_json
      # calculate correct values
      beverage = calculate_values(instant_coffee, 8)
      puts 'cup of instant coffee'
      puts beverage
    else
      puts 'beverage currently not listed'
      return false
    end

    puts beverage

    @serving = Serving.new(
      date:serving_params[:date],
      beverage_type:serving_params[:beverage_type],
      size: 1,
      disposable_cup:serving_params[:disposable_cup],
      purchase_id:serving_params[:purchase_id],
      #user_id:consumer.id,
      user_id:2,
      caffeine:beverage['caffeine'],
      cal:beverage['cal'],
      sugar:beverage['sugar'],
      fat:beverage['fat'])

    if @serving.save
      render json: @serving, status: :created, location: @serving
    else
      render json: @serving.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /servings/1
  # def update
  #   if @serving.update(serving_params)
  #     render json: @serving
  #   else
  #     render json: @serving.errors, status: :unprocessable_entity
  #   end
  # end

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
      params.require(:serving).permit(:date, :beverage_type, :size, :cal, :caffeine, :sugar_content, :disposable_cup, :purchase_id)
    end
end
