require "json"
require "open-uri"
require_relative "../app/models/cocktail.rb"
require_relative "../app/models/ingredient.rb"
require_relative "../app/models/cocktail_ingredient.rb"

puts 'cleaning database'
CocktailIngredient.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all



puts "Creating cocktails"

url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"

margarita_serialized = URI.open(url).read
margaritas = JSON.parse(margarita_serialized)["drinks"]

margaritas.each do |margarita|
  cocktail = Cocktail.create!(
    name: margarita["strDrink"],
    image_url: margarita["strDrinkThumb"],
    category: margarita["strCategory"],
    alcoholic: margarita["strAlcoholic"],
    IBA: margarita["strIBA"],
    glass: margarita["strGlass"],
    instructions: margarita["strInstructions"]
  )

  puts "Finish creating #{cocktail.name}"
  puts "creating ingredients and doses"

  1.upto(15) do |i|
    ingredient_name = margarita["strIngredient#{i}"]
    if ingredient_name.present?
      ingredient = Ingredient.find_or_create_by(name: ingredient_name)
      amount_oz = margarita["strMeasure#{i}"].to_f
      amount_cl = amount_oz * 2.957

      CocktailIngredient.create(cocktail: cocktail, ingredient: ingredient, amount: amount_cl.round)
    end
  end
end
