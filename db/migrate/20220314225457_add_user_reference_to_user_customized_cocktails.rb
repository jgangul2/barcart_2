class AddUserReferenceToUserCustomizedCocktails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_customized_cocktails, :users
    add_index :user_customized_cocktails, :user_id
    change_column_null :user_customized_cocktails, :user_id, false
  end
end
