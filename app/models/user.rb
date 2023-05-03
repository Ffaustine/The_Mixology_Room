class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_cocktails
  has_many :favorites, through: :favorite_cocktails, source: :cocktail

  validates :email, presence: true
  validates :password, confirmation: true, unless: -> { password.blank? }
end
