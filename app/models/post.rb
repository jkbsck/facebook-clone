class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  accepts_nested_attributes_for :likes
end
