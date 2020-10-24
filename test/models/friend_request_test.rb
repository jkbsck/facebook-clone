require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  # setup do
  #   @friend_request = User.last.friend_requests_as_requestor.build(receiver: User.first)
  # end
  
  test "friend request receiver" do
    @friend_request = friend_requests(:friend_request_one)
    #assert @friend_request.receiver == users(:user_two)
    assert @friend_request.save
  end

  test "friend request unique both ways" do
    @friend_request_three = friend_requests(:friend_request_three)
    @friend_request_three.save
    @friend_request_four = friend_requests(:friend_request_four)
    assert_not @friend_request_four.save
  end

  test "friend request send to herself" do
    @friend_request = friend_requests(:friend_request_five)
    assert_not @friend_request.save
  end
end
