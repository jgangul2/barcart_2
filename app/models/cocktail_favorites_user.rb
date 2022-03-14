class CocktailFavoritesUser < ApplicationRecord
  # Direct associations

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
