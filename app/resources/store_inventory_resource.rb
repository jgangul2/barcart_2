class StoreInventoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_id, :integer
  attribute :price, :integer
  attribute :ingredient_id, :integer

  # Direct associations

  belongs_to :store

  # Indirect associations

end
