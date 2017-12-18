# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
beverages = Beverage.create([{name: 'Egg Nog'}, {description: 'The classic holiday drink'}, {recipe: 'Eggs, nog, whiskey, and rum'}, {rating:1 }, {occasion: 'Christmas'}])
