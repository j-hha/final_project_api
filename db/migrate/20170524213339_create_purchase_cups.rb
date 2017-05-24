class CreatePurchaseCups < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_cups do |t|
      t.date :date
      t.float :price
      t.string :brand
      t.integer :rating
      t.boolean :fair_trade

      t.timestamps
    end
  end
end
