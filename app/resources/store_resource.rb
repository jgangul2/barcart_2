class StoreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_name, :string
  attribute :location, :string

  # Direct associations

  has_many :store_inventories

  # Indirect associations

  many_to_many :brand_ingredients,
               resource: SpiritsBrandResource
end
