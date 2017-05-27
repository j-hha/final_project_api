class AddForeignKeysToServings < ActiveRecord::Migration[5.0]
  def change
    add_column :servings, :user_id, :integer
    add_column :servings, :purchase_id, :integer
  end
end
