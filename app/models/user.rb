class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_and_belongs_to_many :roles

  def name
    "#{first_name} #{last_name}"
  end

  def role
    roles.collect(&:name).try(:first)
  end

  def admin?
    roles.collect(&:name).include?("Admin")
  end

  def customer?
    roles.collect(&:name).include?("Customer")
  end
end
