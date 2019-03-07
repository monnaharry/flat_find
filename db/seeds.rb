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
Image.destroy_all
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
  # user.remote_profile_pic_url = "https://source.unsplash.com/collection/3107814/#{(1..150).to_a.sample}"
  user.save
end

# 5.times do |flat|
#   flat = Flat.new
#   flat.name = Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample
#   flat.address = Faker::Address.full_address
#   flat.description = Faker::Hipster.paragraphs([1, 2, 3].sample, true).join("\n")
#   flat.price = (10..300).to_a.sample
#   flat.user_id = User.all.sample.id
#   flat.save
#   (3..5).to_a.sample.times do |image|
#     image = Image.new
#     image.remote_url_url = "https://source.unsplash.com/collection/1134892/#{(1..150).to_a.sample}"
#     image.flat_id = flat.id
#     image.save
#   end
# end

puts 'Adding admin user'

admin = User.new()
admin.name = "Admin"
admin.email = "admin@admin.com"
admin.gender = "prefer not to say"
admin.password = 'admin123'
admin.password_confirmation = 'admin123'
admin.birth_date = Faker::Date.birthday(18, 65)
admin.phone_number = Faker::PhoneNumber.cell_phone
admin.remote_profile_pic_url = "https://i.imgur.com/1tpvNmh.jpg"
admin.admin = true
admin.save!

