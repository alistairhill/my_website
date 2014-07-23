class User < ActiveRecord::Base
  has_secure_password
  has_many :articles
  has_many :comments
  validates :username, presence: true
  validates :password_digest, presence: true
end