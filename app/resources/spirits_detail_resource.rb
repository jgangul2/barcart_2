class SpiritsDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  has_many   :spirits_brands,
             foreign_key: :spirit_id

  has_many   :cocktail_recipes_standards,
             foreign_key: :ingredient_id

  # Indirect associations

  has_many :store_inventories do
    assign_each do |spirits_detail, store_inventories|
      store_inventories.select do |s|
        s.id.in?(spirits_detail.store_inventories.map(&:id))
      end
    end
  end
end
