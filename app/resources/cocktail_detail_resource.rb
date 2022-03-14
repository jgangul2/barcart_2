class CocktailDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string
  attribute :image_url, :string

  # Direct associations

  has_many   :cocktail_favorites_users,
             foreign_key: :cocktail_id

  has_many   :cocktail_recipes_standards,
             foreign_key: :cocktail_id

  # Indirect associations

end
