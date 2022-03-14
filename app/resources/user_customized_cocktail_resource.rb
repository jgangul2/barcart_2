class UserCustomizedCocktailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :cocktail_id, :integer
  attribute :ingredient_id, :integer

  # Direct associations

  # Indirect associations

end
