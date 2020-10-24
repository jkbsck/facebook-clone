require "application_system_test_case"

class FriendRequestsTest < ApplicationSystemTestCase
  # These tests are unfinished
  
  setup do
    visit new_user_session_url
    fill_in('Email', with: 'name.surname@example.com')
    fill_in('Password', with: 's556sfgg5s6  5d')
    click_button "Log in"
  end

  test "send friend request" do

    visit new_user_session_url
    fill_in('Email', with: 'bruno@example.com')
    fill_in('Password', with: '123456')
    click_button "Log in"

    visit posts_url

    @friend_request = friend_requests(:friend_request_one)
    click_button 'Add Friend'
    assert_text 'Friend request was successfully created.'
  end

  test "accept friend request" do
    @friend_request = friend_requests(:friend_request_one)
    click_button 'Add Friend'

    visit new_user_session_url
    fill_in('Email', with: 'namesurname@example.com')
    fill_in('Password', with: 'bru45ddda87lle?')
    click_button "Log in"

    visit posts_url
    @friend_request = friend_requests(:friend_request_one)
    click_button 'Accept'
    assert_text 'Friend request was successfully updated(accepted).'
  end
end
