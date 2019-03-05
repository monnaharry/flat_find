# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts 'Cleaning database...'
Reservation.destroy_all
Flat.destroy_all
User.destroy_all

puts 'Generating fake data...'

20.times do |user|
  user = User.new()
  user.name = [Faker::TvShows::Friends.character, Faker::TvShows::GameOfThrones.character].sample
  user.email = Faker::Internet.email(user.name, '.')
  user.gender = ["male", "female", "prefer not to say"].sample
  user.password = 'password'
  user.password_confirmation = 'password'
  user.birth_date = Faker::Date.birthday(18, 65)
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.save
end

5.times do |flat|
  flat = Flat.new
  flat.name = Faker::TvShows::Simpsons.location
  flat.address = Faker::Address.full_address
  flat.description = Faker::Hipster.paragraphs([1, 2, 3].sample, true)
  flat.price = (10..300).to_a.sample
  flat.picture = "https://source.unsplash.com/collection/1134892/#{(1..15).to_a.sample}"
  flat.user_id = User.all.sample.id
  flat.save
end
