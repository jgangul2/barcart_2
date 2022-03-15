class SpiritsBrand < ApplicationRecord
  # Direct associations

  has_many   :user_customized_cocktails,
             foreign_key: "ingredient_id",
             dependent: :destroy

  has_many   :user_bar_carts,
             foreign_key: "spirit_brand_id",
             dependent: :destroy

  has_many   :store_inventories,
             foreign_key: "ingredient_id",
             dependent: :destroy

  belongs_to :spirit,
             class_name: "SpiritsDetail"

  # Indirect associations

  has_many   :stores,
             through: :store_inventories,
             source: :store

  # Validations

  # Scopes

  def to_s
    name
  end
end
