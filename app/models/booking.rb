class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :review
end
