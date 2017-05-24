class CreateConsumptions < ActiveRecord::Migration[5.0]
  def change
    create_table :consumptions do |t|
      t.date :date
      t.string :beverage_type
      t.integer :size
      t.float :cal
      t.float :caffeine
      t.boolean :disposable_cup

      t.timestamps
    end
  end
end
