class SpiritsDetail < ApplicationRecord
  # Direct associations

  has_many   :spirits_brands,
             foreign_key: "spirit_id",
             dependent: :destroy

  has_many   :cocktail_recipes_standards,
             foreign_key: "ingredient_id",
             dependent: :destroy

  # Indirect associations

  has_many   :store_inventories,
             through: :spirits_brands,
             source: :store_inventories

  # Validations

  # Scopes

  def to_s
    name
  end
end
