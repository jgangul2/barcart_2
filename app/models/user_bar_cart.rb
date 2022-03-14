class UserBarCart < ApplicationRecord
  # Direct associations

  belongs_to :spirit_brand,
             :class_name => "SpiritsBrand"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
