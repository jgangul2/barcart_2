class CreateSpiritsBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :spirits_brands do |t|
      t.integer :spirit_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
