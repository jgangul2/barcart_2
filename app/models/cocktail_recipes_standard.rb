class CocktailRecipesStandard < ApplicationRecord
  # Direct associations

  belongs_to :ingredient,
             class_name: "SpiritsDetail"

  belongs_to :cocktail,
             class_name: "CocktailDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    cocktail.to_s
  end
end
