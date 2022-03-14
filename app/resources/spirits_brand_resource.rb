class SpiritsBrandResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :spirit_id, :integer
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  has_many   :store_inventories,
             foreign_key: :ingredient_id

  belongs_to :spirit,
             resource: SpiritsDetailResource

  # Indirect associations

end
