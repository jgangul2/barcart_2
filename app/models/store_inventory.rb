class StoreInventory < ApplicationRecord
  # Direct associations

  belongs_to :ingredient,
             class_name: "SpiritsBrand"

  belongs_to :store

  # Indirect associations

  has_one    :spirit,
             through: :ingredient,
             source: :spirit

  # Validations

  # Scopes

  def to_s
    store.to_s
  end
end
