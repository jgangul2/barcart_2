class UserCustomizedCocktail < ApplicationRecord
  # Direct associations

  belongs_to :ingredient,
             class_name: "SpiritsBrand"

  belongs_to :cocktail,
             class_name: "CocktailDetail"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
