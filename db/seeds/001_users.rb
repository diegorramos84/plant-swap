require 'faker'
# User.destroy_all
# puts "Destroying Users"

user1 = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "3 Acorn Lodge, 21 Fulready Road",
    postcode: "E10 6ED",
    email: Faker::Internet.email,
    password:"123456",
    average_rating: rand(1..5)
)

user2 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "24 St Margarets Road",
  postcode: "E12 5DP",
  email: Faker::Internet.email,
  password:"123456",
  average_rating: rand(1..5)
)

user3 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "6 Cowper Avenue",
  postcode: "E6 1BJ",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)

user4 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "75 Hampton Road",
  postcode: "E4 8NP",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)

user5 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "114 Plashet Road",
  postcode: "E13 0QS",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)

puts user3[:id]
puts user2[:id]
