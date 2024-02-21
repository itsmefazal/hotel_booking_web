class Transaction < ApplicationRecord
  has_many :payments
  has_many :bookings, through: :payments
end
