class FriendRequest < ApplicationRecord
  belongs_to :requestor, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_one :friendship

  accepts_nested_attributes_for :friendship
  validate :friend_request_valid?

  def friend_request_valid?
    # Can not send request to herself
    if requestor_id == receiver_id 
      errors.add(:receiver_id, "Can not be same as requestor.")
    # Can not make a request that already exists in opposite direction  
    elsif FriendRequest.all.any? { |r| r.receiver.id == requestor_id &&
                                       r.requestor.id == receiver_id }
      errors.add(:receiver_id, "Friend request already exists.")
    end
  end
end
