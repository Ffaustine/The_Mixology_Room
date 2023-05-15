class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients

  has_many :favorite_cocktails
  has_many :favorited_by, through: :favorite_cocktails, source: :user

  validates :name, presence: true
  validates :image_url, presence: true
  validates :category, presence: true
  validates :alcoholic, presence: true
end
