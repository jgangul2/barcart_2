class CocktailRecipesStandardResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :cocktail_id, :integer
  attribute :ingredient_id, :integer
  attribute :quantity, :string

  # Direct associations

  # Indirect associations

end
