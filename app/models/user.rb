class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_post, through: :comments, source: :post

  validates :username, presence: true, uniqueness: true,length: {minimum: 4, maximum: 12}
  validates :email,presence: true, format: { with: /\S+@\S+/}, uniqueness: { case_sensitive: false}
end