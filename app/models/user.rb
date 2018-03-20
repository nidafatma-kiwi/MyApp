class User < ApplicationRecord
	validates :email, :uniqueness => { message: 'Email Id Already exist', case_sensitive: false}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :name, :email, :age, presence: true
  validates :location, length: { maximum: 25 }
  validates :age, numericality: {message: 'Age should be numerical'}
end