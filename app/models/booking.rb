class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :review
  has_one :chatroom
end
