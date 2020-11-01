class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  
  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: "FriendRequest", dependent: :destroy
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: "FriendRequest", dependent: :destroy
  accepts_nested_attributes_for :friend_requests_as_receiver
  accepts_nested_attributes_for :friend_requests_as_receiver

  #has_many :friendships, ->(user){ where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id) }
  #has_many :friends, through: :friendships, source: :users
  #has_many :friend_bs, through: :friendships, foreign_key: :friend_b_id, source: :users

  has_many :friendships, foreign_key: :friend_id
  has_many :friends, through: :friendships, source: :inverse_friend
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :inverse_friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :friend

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post

  def self.search(search)
    if search 
      where(["LOWER(username) LIKE ?","%#{search.downcase}%"])
    else
      all
    end
  end 
end
