class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients

  has_many :favorite_cocktails
  has_many :favorited_by, through: :favorite_cocktails, source: :user

  validates :name, presence: true, uniqueness: true
  validates :instruction, presence: true, length: { minimum: 20 }
  validates :image_url, presence: true
  validates :category, presence: true #inclusion: %w["Alcoholic" "Non alcoholic"]
end
