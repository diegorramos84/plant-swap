class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plants, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :username, uniqueness: true
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
end
