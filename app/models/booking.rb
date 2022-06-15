class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :review, dependent: :destroy
  has_one :chatroom, dependent: :destroy
end
