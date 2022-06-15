@review1 = Review.create!(
  content: "Gorgeous plant! User was in the agreed place on time to plant-swap",
  rating: 5,
  booking_id: @booking1[:id]
)

@review2 = Review.create!(
  content: "Great plant! Thank you!",
  rating: 5,
  booking_id: @booking2[:id]
)

@review3 = Review.create!(
  content: "Great experience",
  rating: 5,
  booking_id: @booking3[:id]
)

@review4 = Review.create!(
  content: "Thanks for my plant baby!",
  rating: 5,
  booking_id: @booking4[:id]
)

@review5 = Review.create!(
  content: "So happy about my plant!",
  rating: 5,
  booking_id: @booking5[:id]
)
