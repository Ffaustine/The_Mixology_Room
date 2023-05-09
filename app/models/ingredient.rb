class Ingredient < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :cocktails, through: :cocktail_ingredients

  validates :name, presence: true
  # validates :description, presence: true
  # validates :image_url, presence: true
end
