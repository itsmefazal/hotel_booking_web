class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  has_many :payments
  has_many :transactions, through: :payments
  has_and_belongs_to_many :rooms
end
