class AddForeignKeyToConsumptions < ActiveRecord::Migration[5.0]
  def change
    add_column :consumptions, :user_id, :integer
    add_column :consumptions, :purchase_cup_id, :integer
    add_column :consumptions, :purchase_pound_id, :integer
  end
end
