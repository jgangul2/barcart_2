json.extract! user_customized_cocktail, :id, :user_id, :cocktail_id, :ingredient_id, :created_at, :updated_at
json.url user_customized_cocktail_url(user_customized_cocktail, format: :json)
