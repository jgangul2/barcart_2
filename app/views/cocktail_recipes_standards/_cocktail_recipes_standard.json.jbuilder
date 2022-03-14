json.extract! cocktail_recipes_standard, :id, :cocktail_id, :ingredient_id,
              :quantity, :created_at, :updated_at
json.url cocktail_recipes_standard_url(cocktail_recipes_standard, format: :json)
