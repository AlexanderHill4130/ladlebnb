# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Review.destroy_all
Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts 'Creating 10 fake users...'
user_host = User.new(
  first_name: host,
  last_name: host,
  email: host@example.com,
  password: "123456")
user_host.save!
user_user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: user@example.com,
  password: "123456")
user_user.save!

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end
puts 'Finished!'

puts 'Creating 10 fake flats...'
10.times do
  flat = Flat.new(
    title:    Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    price:  rand(25..50),
    guests_nr: rand(1..4),
    user: User.all.sample
  )
  flat.remote_photo_url = Faker::Avatar.image

  flat.save!
end
puts 'Finished!'

puts 'Creating 10 fake bookings...'
10.times do
  booking = Booking.new(
    check_in: Faker::Date.forward(10),
    check_out: Faker::Date.forward(15),
    guests_nr: rand(1..4),
    price:  5*rand(25..50),
    status: "pending",
    user: User.all.sample,
    flat: Flat.all.sample
  )
  booking.save!
end
puts 'Finished!'

puts 'Creating 10 fake reviews...'
10.times do
  review = Review.new(
    rating: rand(0..5),
    content: Faker::Lorem.sentence,
    booking: Booking.all.sample
  )
  review.save!
end
puts 'Finished!'
