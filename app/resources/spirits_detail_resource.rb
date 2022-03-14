class SpiritsDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many   :spirits_brands,
             foreign_key: :spirit_id

  has_many   :cocktail_recipes_standards,
             foreign_key: :ingredient_id

  # Indirect associations

end
