class AddSpiritBrandReferenceToUserBarCarts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_bar_carts, :spirits_brands, column: :spirit_brand_id
    add_index :user_bar_carts, :spirit_brand_id
    change_column_null :user_bar_carts, :spirit_brand_id, false
  end
end
