class StoreInventoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_id, :integer
  attribute :price, :integer
  attribute :ingredient_id, :integer

  # Direct associations

  belongs_to :ingredient,
             resource: SpiritsBrandResource

  belongs_to :store

  # Indirect associations

  has_one    :spirit,
             resource: SpiritsDetailResource

  filter :spirit_id, :integer do
    eq do |scope, value|
      scope.eager_load(:spirit).where(spirits_brands: { spirit_id: value })
    end
  end
end
