class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  # validates :amount, presence: true
  # validates :unit, presence: true
end

# changer oz en cl et inch en cm
