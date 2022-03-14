json.extract! cocktail_detail, :id, :name, :description, :image_url,
              :created_at, :updated_at
json.url cocktail_detail_url(cocktail_detail, format: :json)
