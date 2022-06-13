class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plants, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_address?
end
