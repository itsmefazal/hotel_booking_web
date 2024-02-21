class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_category
  has_and_belongs_to_many :bookings
end
