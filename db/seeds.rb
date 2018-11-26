# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  FactoryBot.create(:movie)
  FactoryBot.create(:person)
end

(1..15).each do |index|
  FactoryBot.create(:role, person_id: index, movie_id: index)
end

User.create(
  email: "admin@mail.com",
  password: '12345678',
  password_confirmation: '12345678'
)