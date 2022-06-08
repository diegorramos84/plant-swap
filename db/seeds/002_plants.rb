@plant1 = Plant.create!(
  user_id: @user1[:id],
  category: "Other",
  plant_type: "Evergreen shrub",
  botanical_name: "Monstera deliciosa",
  common_name: "Cheese plant",
  description: "This plant’s latin name, monstera deliciosa, translates as - you’ve probably worked this out -
  ‘delicious monster’. And isn’t it just. The monster part is likely because of its huge, glossy leaves.
  The delicious part is because in the wild it bears (apparently) very tasty fruit.",
  light_conditions: "Medium light",
  mature_height: 130,
  quantity: 4,
  indoor: true
)

url = "https://res.cloudinary.com/lardocelar/image/upload/v1654610144/cheese_zd0lro.png"
photo = URI.open(url)
@plant1.photo.attach(io: photo, filename: "plant.jpg", content_type: "image/png")
@plant1.save

@plant2 = Plant.create!(
  user_id: @user2[:id],
  category: "Hanging & climbing",
  plant_type: "Evergreen vine",
  botanical_name: "Epipremnum aureum",
  common_name: "Devil’s ivy",
  description: "it's one of the most popular houseplants in the world. There are two reasons for that. 1) It's extremely
   versatile. It's a fantastic hanging plant, looks great on a shelf or mantelpiece, or can even be trained up a wall. 2)
   It's incredibly easy to care for",
  light_conditions: "Most light conditions",
  mature_height: 160,
  quantity: 5,
  indoor: true
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654610143/devil_k6i5id.jpg"
photo = URI.open(url)
@plant2.photo.attach(io: photo, filename: "plant.jpg", content_type: "image/png")
@plant2.save

@plant3 = Plant.create!(
  user_id: @user3[:id],
  category: "Fern",
  plant_type: "Evergreen shrub",
  botanical_name: "Nephrolepis Exaltata",
  common_name: "Boston Fern",
  description: "You’ll find Boston Ferns in the wild in humid, shady areas, like swamps and forests,
  in South and Central America, the West Indies and Africa. They love anywhere wet, hot and not too bright.
  As a houseplant, they really became popular with the Victorians.",
  light_conditions: "Most light conditions",
  mature_height: 50,
  quantity: 2,
  indoor: true
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654610143/boston_bqgmwx.jpg"
photo = URI.open(url)
@plant3.photo.attach(io: photo, filename: "plant.jpg", content_type: "image/png")
@plant3.save

@plant4 =Plant.create!(
  user_id: @user4[:id],
  category: "Cacti & succulents",
  plant_type: "",
  botanical_name: "Euphorbia",
  common_name: "Euphorbia",
  description: "The euphorbia looks like the quintessential cactus, although it’s technically not one
  (it grows very very tiny leaves, which cacti do not). It’s native to Southern Africa,
    where it stands out in the dry scrublands, basking in the blazing sun.",
  light_conditions: "Bright light",
  mature_height: 90,
  quantity: 1,
  indoor: true
)

url = "https://res.cloudinary.com/lardocelar/image/upload/v1654610143/euph_z4cdy4.jpg"
photo = URI.open(url)
@plant4.photo.attach(io: photo, filename: "plant.jpg", content_type: "image/png")
@plant4.save

@plant5 = Plant.create!(
  user_id: @user5[:id],
  category: "Hanging & climbing",
  plant_type: "",
  botanical_name: "Scindapsus pictus",
  common_name: "Satin pothos",
  description: "",
  light_conditions: "Most light conditions",
  mature_height: 40,
  quantity: 4,
  indoor: true
)
url = "https://res.cloudinary.com/lardocelar/image/upload/v1654610143/satin_k7pkt5.jpg"
photo = URI.open(url)
@plant5.photo.attach(io: photo, filename: "plant.jpg", content_type: "image/png")
@plant5.save
