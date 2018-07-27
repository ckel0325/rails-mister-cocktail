require 'open-uri'
require 'json'

Ingredient.delete_all
puts "Deleted all ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail = open(url).read
results = JSON.parse(cocktail)

ingredients = results["drinks"].map do |result|
  result["strIngredient1"]
end

ingredients.sort!

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

puts "created #{Ingredient.count} ingredients!"
