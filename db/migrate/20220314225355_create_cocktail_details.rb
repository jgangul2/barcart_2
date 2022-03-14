class CreateCocktailDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_details do |t|
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
