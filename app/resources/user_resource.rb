class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :screen_name, :string

  # Direct associations

  has_many   :user_customized_cocktails

  has_many   :user_bar_carts

  has_many   :cocktail_favorites_users

  # Indirect associations
end
