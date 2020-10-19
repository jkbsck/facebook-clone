require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  setup do
    @friend_request = User.last.friend_requests_as_requestor.build
  end
  
  test "friend request receiver" do
    assert @friend_request.save
  end
end
