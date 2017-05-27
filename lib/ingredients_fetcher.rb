require 'net/http'
require 'json'
require 'dotenv-rails'

class IngredientsFetcher
  def initialize
    # object holds the ndbnos for wanted food items
    @food_no = {
      'espresso' => '14210',
      'black_coffee' => '14209',
      'instant_coffee' => '14215',
      'whole_milk' => '01077'
    }

    # object holds the ndb nutrient_ids for wanted nutrients
    @nutrient_no = {
    'cal' => '208',
    'caffeine' => '262',
    'sugar' => '269',
    'fat' => '204'
    }
  end

  def pull_out_nutrient_data (food, nutrient_num)
    if @data.nil?
      uri = URI('https://api.nal.usda.gov/ndb/V2/reports')
      params = { :ndbno => [@food_no['espresso'], @food_no['black_coffee'], @food_no['instant_coffee'], @food_no['whole_milk']], :type => 'b', :format => 'JSON', :api_key => ENV['NDB_API_KEY']}
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        @data = JSON.parse(res.body)
        puts 'SUCCESS'
      else
        puts res.code
        return nil
      end
    end
    # find the food item by food id
    @data['foods'].each do |item|
      if item['food']['desc']['ndbno'] == food
        # find the nutrient by nutrient id
        item['food']['nutrients'].each do |nutrient|
          if nutrient['nutrient_id'] == nutrient_num
            # find the value for this nutrient for amount of 1 fl oz
            nutrient['measures'].each do |measure|
              if measure['label'] === 'fl oz' && measure['qty'] === 1.0
                # return the value
                return measure['value'].to_f
              end # closes if measure['label'] ...
            end # closes  nutrient['measures'].each ...
          end # closes if nutrient['nutrient_id'] ...
        end # closes item['food']['nutrients'].each  ...
      end # closes if item['food']['desc']['ndbno']  ...
    end # closes RESPONSE['foods'].each do ...
  end # closes method ...

  def get_ingredients
    # initialize ingredients object to hold all wanted beverages and nutrients
    ingredients = {}

    # fill ingredients object with content for all wanted beverages and nutrients
    # for each beverage the ndb was queried for
    @food_no.each do |beverage, id|
      # initialize an empty object to be filled with nutrient data for ONE beverage at the time
      item = {
        # all values are given for 1 fl oz of beverage
        'unit' => '1 fl oz',
        'beverage_type' => beverage
      }
      # for each nutrient the ndb was queried for
      @nutrient_no.each do |nutrient, num|
        # save a key by the nutrient's name with the respective nutrient value we got back from the pull_out_nutrient_data method
        item[nutrient] = pull_out_nutrient_data(id, num)
      end
      # save save a key by the beverage's name holding the respective beverage object to the ingredients object
      ingredients[beverage] = item
    end
    return ingredients
  end
end
