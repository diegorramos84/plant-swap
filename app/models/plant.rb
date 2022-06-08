class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  include PgSearch::Model
  pg_search_scope :search_by_name_type_and_category,
    against: [:common_name, :botanical_name, :plant_type, :category],
    using: {
      tsearch: { prefix: true }
    }
end
