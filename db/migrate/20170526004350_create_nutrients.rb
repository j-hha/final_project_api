class CreateNutrients < ActiveRecord::Migration[5.0]
  def change
    create_table :nutrients do |t|
      t.string :beverage_type
      t.float :cal
      t.float :caffeine
      t.float :sugar
      t.float :fat

      t.timestamps
    end
  end
end
