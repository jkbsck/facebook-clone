class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook] # it's different on medium --> :omniauth_providers => [:facebook]

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

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  def self.search(search)
    if search 
      where(["LOWER(username) LIKE ?","%#{search.downcase}%"])
    else
      all
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
end
