# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(filepath).read
ingredients = JSON.parse(serialized_ingredients)

default_ingredients = ingredients['drinks']

Cocktail.destroy_all

puts "creating Ingredients"

default_ingredients.each do |i|
  Ingredient.create(name: i['strIngredient1'])
end

puts "done!"

puts Ingredient.all
puts Cocktail.all

# puts "destroying cocktails"
# Cocktail.destroy_all


Rails.env.development? do 
  puts "creating 60 ingredients"

  Ingredient.destroy_all

  20.times do
    puts "."
    Ingredient.create(name: Faker::Food.fruits)
  end

  20.times do
    puts "."
    Ingredient.create(name: Faker::Food.ingredient)
  end

  20.times do
    puts "."
    Ingredient.create(name: Faker::Food.spice)
  end

  puts "done!"
end
