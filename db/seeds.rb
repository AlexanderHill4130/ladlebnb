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
    title:    Faker::Address.community,
    description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    latitude: rand(9.0..10),
    longitude: rand(9.0..10),
    price:  rand(25..50),
    guests_nr: rand(1..4),
    user: User.all.sample
  )
  flat.remote_photo_url = "https://source.unsplash.com/400x300/?house,home"
  flat.save!
end
puts 'Finished!'

puts 'Creating 10 fake bookings...'
10.times do
  booking = Booking.new(
    check_in: 20191212,
    check_out: 20191214,
    guests_nr: 1,
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
    content: Faker::Quote.famous_last_words,
    booking: Booking.all.sample
  )
  review.save!
end
puts 'Finished!'
