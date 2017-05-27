class AddFatContentKeyToServings < ActiveRecord::Migration[5.0]
  def change
    add_column :servings, :fat, :float
  end
end
