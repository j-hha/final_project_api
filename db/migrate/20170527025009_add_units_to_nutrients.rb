class AddUnitsToNutrients < ActiveRecord::Migration[5.0]
  def change
    add_column :nutrients, :unit, :string
  end
end
