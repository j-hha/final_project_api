class AddForeignKeyToPurchasePounds < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_pounds, :user_id, :integer
  end
end
