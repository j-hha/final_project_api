class CreateServings < ActiveRecord::Migration[5.0]
  def change
    create_table :servings do |t|
      t.date :date
      t.string :beverage_type
      t.integer :size
      t.float :cal
      t.float :caffeine
      t.float :sugar_content
      t.boolean :disposable_cup

      t.timestamps
    end
  end
end
