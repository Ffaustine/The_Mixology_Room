class User < ApplicationRecord
  has_many :favorite_cocktails
  has_many :favorites, through: :favorite_cocktails, source: :cocktail

  validates :email, presence: true
  validates :password, confirmation: true, unless: -> { password.blank? }
  validates :username, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
