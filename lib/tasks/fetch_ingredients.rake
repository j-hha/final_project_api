require 'ingredients_fetcher.rb'

desc "This task fetches all ingredients from nutrition db"
task :fetch_ingredients => :environment do
  puts "Updating ingredients..."
  fetcher = IngredientsFetcher.new
  data = fetcher.get_ingredients
  data.each do |beverage_name, obj|
    existing_entry = Nutrient.find_by(beverage_type: beverage_name)
    if existing_entry
      existing_entry.update(obj)
    else
      Nutrient.create(obj)
    end
  end
  puts "done."
end
