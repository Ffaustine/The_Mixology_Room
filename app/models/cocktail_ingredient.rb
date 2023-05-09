class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  # validates :amount, presence: true
  # validates :unit, presence: true
  validates :instructions, presence: true, length: { minimum: 20 }
end

# changer oz en cl et inch en cm
