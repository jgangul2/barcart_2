class SpiritsBrand < ApplicationRecord
  # Direct associations

  belongs_to :spirit,
             :class_name => "SpiritsDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    spirit.to_s
  end

end
