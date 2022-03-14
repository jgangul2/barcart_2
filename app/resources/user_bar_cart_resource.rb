class UserBarCartResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :spirit_brand_id, :integer
  attribute :quantity, :integer

  # Direct associations

  belongs_to :spirit_brand,
             resource: SpiritsBrandResource

  belongs_to :user

  # Indirect associations

end
