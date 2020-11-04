# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate a bunch of additional users.
50.times do |n|
    name = Faker::Name.name
    wins_count = 0
    loses_count = 0
    User.create!(name: name,
                wins_count: wins_count,
                loses_count: loses_count)
  end