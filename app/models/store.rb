class Store < ApplicationRecord
  # Direct associations

  has_many   :store_inventories,
             dependent: :destroy

  # Indirect associations

  has_many   :brand_ingredients,
             through: :store_inventories,
             source: :ingredient

  # Validations

  # Scopes

  def to_s
    store_name
  end
end
