class AddUserReferenceToUserBarCarts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_bar_carts, :users
    add_index :user_bar_carts, :user_id
    change_column_null :user_bar_carts, :user_id, false
  end
end
