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
# cocktail = Cocktail.create!({
#     name: "Margarita",
#     image_url:"https://resize.elle.fr/portrait_480_webp/var/plain_site/storage/images/elle-a-table/recettes-de-cuisine/margarita-2037408/9397186-12-fre-FR/Margarita.jpg",
#     category: "Alcoholic",
#     IBA: "Contemporary Classics",
#     glass: "cocktail glass"
#   }
# )

#   puts "Finish creating #{cocktail.name}"

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
  glass: margarita["strGlass"]
  )
  puts "Finish creating #{cocktail.name}"
  puts "creating ingredients and doses"
  1.upto(15) do |i|
    ingredient_name = margarita["strIngredient#{i}"]
    if ingredient_name.present?
      ingredient = Ingredient.find_or_create_by(name: ingredient_name)
      CocktailIngredient.create(cocktail: cocktail, ingredient: ingredient, amount: margarita["strMeasure#{i}"], instruction: margarita["strInstructions"])
    end
  end
end
puts "Finished"
