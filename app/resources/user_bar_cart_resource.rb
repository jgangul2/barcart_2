class UserBarCartResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :spirit_brand_id, :integer
  attribute :quantity, :integer

  # Direct associations

  # Indirect associations

end
