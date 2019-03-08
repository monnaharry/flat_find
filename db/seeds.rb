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
  user.save
  user.remote_profile_pic_url = "https://source.unsplash.com/collection/3107814/600x600/?sig=#{(1..150).to_a.sample}"
  user.save
end

# 5.times do |flat|
#   flat = Flat.new
#   flat.name = Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample
#   flat.address = Faker::Address.full_address
#   flat.description = Faker::Hipster.paragraphs([1, 2, 3].sample, true).join("\n")
#   flat.price = (10..300).to_a.sample
#   flat.user_id = User.all.sample.id
#   flat.longitude = rand(2.002..2.222).round(5)
#   flat.latitude = rand(41.012..41.722).round(5)
#   flat.save


  Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "R Desidério Bessa 32, Lisbon",
    description: "Enjoy Lisbon, while living in a new, apartment. It is centrally-heated apartment in a central historic part of town!",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Shared room",
  })

    Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "R. Saco, Lisbon",
    description: "Luna Parque is a typical Lisbon apartment of the 40s, full of atmosphere that will remind you to a magical place. The wide dining areas overlook the private garden, a perfect place to chill out in the city center.",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Private room",
  })

    Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "Alfama, Lisbon",
    description: "If you want to experience the locals way of living, this is the place to be!",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Entire place",
  })

    Flat.create!({
      name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
      address: "Sintra, Portugal",
      description: "Charming city view apartment on Lisbon's beautiful Castle hill",
      price: (10..300).to_a.sample,
      user_id: User.all.sample.id,
      longitude: rand(2.002..2.222).round(5),
      latitude: rand(41.012..41.722).round(5),
      room_type: "Shared room",
  })

    Flat.create!({
      name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
      address: "São Domingos de Benfica, Lisbon",
      description: "Stylish and cozy apartment on Lisbon's hillside with sea views. Situated in the historical “Graça” neighbourhood, on the highest of the seven hills of Lisbon, this sunny apartment recently renovated with modern appliances.",
      price: (10..300).to_a.sample,
      user_id: User.all.sample.id,
      longitude: rand(2.002..2.222).round(5),
      latitude: rand(41.012..41.722).round(5),
      room_type: "Entire place",
  })

    Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "Avenida de Santa Catalina, Habana, Cuba",
    description: "Authentic Cuban newly renovated apartment. Close to the main attractions and old Havana. Restaurants, bars, supermarkets and tourist attractions all in walking distance.",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Entire place",
  })

  Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "Avenida Varona, Habana, Cuba",
    description: "I can't describe how you will feel staying here in this stylish bedroom located on the roof top in Old Havana with awe inspiring views to the city and the ocean",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Private room",
  })

  Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "Centro Habana, Habana, Cuba",
    description: "Share drinks and conversation under the stars outside this lovely Old Havana home",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Private room",
  })

Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "San Cristobal, Cuba",
    description: "Wake up and step out onto the sun-drenched terraces for coffee, tea, or natural juice. Near to all sightseeing, restaurants, museums, galleries art, bars, etc.",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Entire place",
  })

Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "Harlem, Cuba",
    description: "We are on the road to Soroa in the Frias neighborhood where you can enjoy beautiful views, take advantage of and share with us the opportunities of life in the countryside. ",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Private room",
  })

Flat.create!({
    name: Faker::Construction.material + " " + %w(hut bungalow cottage ranch tower housebarn).sample,
    address: "Bahia Honda, Cuba",
    description: "Our house is located 2 miles from the Soroa that has the largest collection of orchids in Cuba, in this house there is an incredible tranquility in addition to being surrounded by the best garden of ornamental plants and around us there are several endemic birds",
    price: (10..300).to_a.sample,
    user_id: User.all.sample.id,
    longitude: rand(2.002..2.222).round(5),
    latitude: rand(41.012..41.722).round(5),
    room_type: "Entire place",
  })


  Flat.all.each do |flat|
  (3..5).to_a.sample.times do |image|
    image = Image.new
    image.remote_url_url = "https://source.unsplash.com/collection/1134892/600x600/?sig=#{(1..150).to_a.sample}"
    image.flat_id = flat.id
    image.save
    end
  end

  puts "Finished!"
    # (3..5).to_a.sample.times do |image|
    #   image = Image.new
    #   image.remote_url_url = "https://source.unsplash.com/collection/1134892/600x600/?sig=#{(1..150).to_a.sample}"
    #   image.flat_id = flat.id
    #   image.save
