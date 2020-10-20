require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.first
  end
  
  test "friend request as requestor" do
    assert_not_empty @user.friend_requests_as_requestor
  end

  test "friend request as receiver" do
    assert_not_empty @user.friend_requests_as_receiver
  end
end
