# user 1 booking a plant from user 2
@booking1 = Booking.create!(
  booking_quantity: 1,
  user_id: @user1[:id],
  plant_id: @plant2[:id],
)

# user 2 booking a plant from user 3
@booking2 = Booking.create!(
  booking_quantity: 1,
  user_id: @user2[:id],
  plant_id: @plant3[:id],
)

# user 3 booking a plant from user 4
@booking3 = Booking.create!(
  booking_quantity: 1,
  user_id: @user3[:id],
  plant_id: @plant4[:id],
)

# user 4 booking a plant from user 5
@booking4 = Booking.create!(
  booking_quantity: 1,
  user_id: @user4[:id],
  plant_id: @plant5[:id],
)

# user 5 booking a plant from user 1
@booking5 = Booking.create!(
  booking_quantity: 1,
  user_id: @user5[:id],
  plant_id: @plant1[:id],
)
