class Store < ApplicationRecord
  # Direct associations

  has_many   :store_inventories,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    store_name
  end

end
