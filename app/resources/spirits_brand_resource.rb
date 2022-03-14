class SpiritsBrandResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :spirit_id, :integer
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  has_many   :user_customized_cocktails,
             foreign_key: :ingredient_id

  has_many   :user_bar_carts,
             foreign_key: :spirit_brand_id

  has_many   :store_inventories,
             foreign_key: :ingredient_id

  belongs_to :spirit,
             resource: SpiritsDetailResource

  # Indirect associations
end
