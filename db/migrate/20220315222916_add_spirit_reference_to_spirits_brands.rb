class AddSpiritReferenceToSpiritsBrands < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :spirits_brands, :spirits_details, column: :spirit_id
    add_index :spirits_brands, :spirit_id
    change_column_null :spirits_brands, :spirit_id, false
  end
end
