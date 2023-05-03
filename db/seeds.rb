require "json"
require "open-uri"


puts 'cleaning database'
Cocktail.destroy_all

puts "Creating cocktails"
# cocktail = Cocktail.create!({
#     name: "Margarita",
#     instruction: "Verser 5cl de tequila dans un verre, rajouter le citron vert",
#     image_url:"https://resize.elle.fr/portrait_480_webp/var/plain_site/storage/images/elle-a-table/recettes-de-cuisine/margarita-2037408/9397186-12-fre-FR/Margarita.jpg",
#     category: "Alcoholic",
#     IBA: "Contemporary Classics",
#     glass: "cocktail glass"
#   }
# )

#   puts "Finish creating #{cocktail.name}"


url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"

margarita_serialized = URI.open(url).read
margarita = JSON.parse(margarita_serialized)

cocktail = Cocktail.create!({
  name: "drinks"[0]["strDrink"]
})

puts "Finish creating #{cocktail.name}"
