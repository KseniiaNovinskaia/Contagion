# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    # t.string "name"
    # t.integer "body_temperature"
    # t.integer "age"
    # t.string "species"

10.times do
  Organism.create!(name: %w[Olaf Bob Kitty Knut].sample, body_temperature: (25..41).to_a.sample, age: (0..100).to_a.sample, address: "Under Den Linden 118 Berlin", species: %w[human pet plant].sample, user_id: 1)
end

