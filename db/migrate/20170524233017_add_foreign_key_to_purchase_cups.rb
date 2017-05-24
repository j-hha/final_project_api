class AddForeignKeyToPurchaseCups < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_cups, :user_id, :integer
  end
end
