class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.boolean :by_cup
      t.date :date
      t.float :price
      t.string :brand
      t.integer :rating
      t.boolean :fair_trade

      t.timestamps
    end
  end
end
