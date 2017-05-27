class AlterColumnServingsSugarContent < ActiveRecord::Migration[5.0]
  def change
    change_table :servings do |t|
      t.rename :sugar_content, :sugar
    end
  end
end
