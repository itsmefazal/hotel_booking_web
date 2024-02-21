class Hotel < ApplicationRecord
  has_many :rooms
  has_many :bookings
  include Searchable
end
