class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
