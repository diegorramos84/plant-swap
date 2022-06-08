require 'faker'
# User.destroy_all
# puts "Destroying Users"

@user1 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "3 Acorn Lodge, 21 Fulready Road",
  postcode: "E10 6ED",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)

url = "https://res.cloudinary.com/lardocelar/image/upload/v1654685294/user_placeholder_kbf1mr.png"
photo = URI.open(url)
@user1.photo.attach(io: photo, filename: "user.png", content_type: "image/png")
@user1.save

@user2 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "24 St Margarets Road",
  postcode: "E12 5DP",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654685294/user_placeholder_kbf1mr.png"
photo = URI.open(url)
@user2.photo.attach(io: photo, filename: "user.png", content_type: "image/png")
@user2.save

@user3 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "6 Cowper Avenue",
  postcode: "E6 1BJ",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654685294/user_placeholder_kbf1mr.png"
photo = URI.open(url)
@user3.photo.attach(io: photo, filename: "user.png", content_type: "image/png")
@user3.save

@user4 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "75 Hampton Road",
  postcode: "E4 8NP",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654685294/user_placeholder_kbf1mr.png"
photo = URI.open(url)
@user4.photo.attach(io: photo, filename: "user.png", content_type: "image/png")
@user4.save

@user5 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "114 Plashet Road",
  postcode: "E13 0QS",
  email: Faker::Internet.email,
  password: "123456",
  average_rating: rand(1..5)
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654685294/user_placeholder_kbf1mr.png"
photo = URI.open(url)
@user5.photo.attach(io: photo, filename: "user.png", content_type: "image/png")
@user5.save
