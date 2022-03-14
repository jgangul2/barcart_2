class UserCustomizedCocktailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :cocktail_id, :integer
  attribute :ingredient_id, :integer

  # Direct associations

  belongs_to :ingredient,
             resource: SpiritsBrandResource

  belongs_to :cocktail,
             resource: CocktailDetailResource

  belongs_to :user

  # Indirect associations

end
