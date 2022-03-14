class CreateUserBarCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_bar_carts do |t|
      t.integer :user_id
      t.integer :spirit_brand_id
      t.integer :quantity

      t.timestamps
    end
  end
end
