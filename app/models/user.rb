class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :user_customized_cocktails,
             dependent: :destroy

  has_many   :user_bar_carts,
             dependent: :destroy

  has_many   :cocktail_favorites_users,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
