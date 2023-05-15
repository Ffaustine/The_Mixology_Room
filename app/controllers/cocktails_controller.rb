require "open-uri"

class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @cocktails = Cocktail.all
    if params[:query].present?
      search
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktail_ingredients = @cocktail.cocktail_ingredients
  end


  private

  def search
    query = params[:query]
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{query}"
    response = URI.open(url).read
    results = JSON.parse(response)["drinks"]

    @cocktails = []
    if results.present?
      results.each do |result|
        if cocktail = Cocktail.find_by(name: result["strDrink"])
          @cocktails << cocktail
        else
          cocktail = Cocktail.create!(
            name: result["strDrink"],
            image_url: result["strDrinkThumb"],
            category: result["strCategory"],
            alcoholic: result["strAlcoholic"],
            IBA: result["strIBA"],
            glass: result["strGlass"],
            instructions: result["strInstructions"]
          )
          1.upto(15) do |i|
            ingredient_name = result["strIngredient#{i}"]
            if ingredient_name.present?
              ingredient = Ingredient.find_or_create_by(name: ingredient_name)
              amount_oz = result["strMeasure#{i}"].to_f
              amount_cl = amount_oz * 2.957

              CocktailIngredient.create!(cocktail: cocktail, ingredient: ingredient, amount: amount_cl.round)
            end
          end
          @cocktails << cocktail
        end
      end
    end
  end
end
