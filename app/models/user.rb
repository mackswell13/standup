class User < ApplicationRecord
  has_secure_password

  validates :email_address, presence: true, uniqueness: true
  validates :password_digest, presence: true, confirmation: true


  has_many :sessions, dependent: :destroy
  belongs_to :company, optional: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
