class CocktailDetail < ApplicationRecord
  # Direct associations

  has_many   :cocktail_favorites_users,
             :foreign_key => "cocktail_id",
             :dependent => :destroy

  has_many   :cocktail_recipes_standards,
             :foreign_key => "cocktail_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
