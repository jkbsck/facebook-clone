class Friendship < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :inverse_friend, class_name: "User"
  belongs_to :friend_request, class_name: "FriendRequest", dependent: :destroy
end
