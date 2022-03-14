class StoreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_name, :string
  attribute :location, :string

  # Direct associations

  # Indirect associations

end