class SpiritsBrand < ApplicationRecord
  # Direct associations

  has_many   :user_bar_carts,
             :foreign_key => "spirit_brand_id",
             :dependent => :destroy

  has_many   :store_inventories,
             :foreign_key => "ingredient_id",
             :dependent => :destroy

  belongs_to :spirit,
             :class_name => "SpiritsDetail"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    spirit.to_s
  end

end
