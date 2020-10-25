class Friendship < ApplicationRecord
  belongs_to :friend_a, class_name: :User
  belongs_to :friend_b, class_name: :User
  belongs_to :friend_request, class_name: :FriendRequest
end
