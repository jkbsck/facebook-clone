# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_list = [
  [ 1, "John Smith", "johnsmith@xmpl.com", "123456" ],
  [ 2, "Aaron Smith", "aaronsmith@xmpl.com", "123456" ],
  [ 3, "John Voight", "johnvoight@xmpl.com", "123456" ],
  [ 4, "Mitch Voight", "mitchvoight@xmpl.com", "123456" ],
  [ 5, "Mitch McConnel", "mitchmcconnel@xmpl.com", "123456" ],
  [ 12, "Fred McConnel", "fredmcconnel@xmpl.com", "123456" ],
  [ 6, "Fred Pence", "fredpence@xmpl.com", "123456" ],
  [ 7, "Mike Pence", "mikepence@xmpl.com", "123456" ],
  [ 8, "Mike Spike", "mikespike@xmpl.com", "123456" ],
  [ 9, "Vicky Spike", "vickyspike@xmpl.com", "123456" ],
  [ 10, "Vicky Bold", "vickybold@xmpl.com", "123456" ],
  [ 11, "Nancy Bold", "nancybold@xmpl.com", "123456" ]
]

friend_requests_list = [
  [ 1, 1, 2, true ], [ 2, 1, 4, true ], [ 3, 1, 5, false ], [ 4, 1, 9, true ],
  [ 5, 2, 4, false ], [ 6, 2, 10, true ], [ 7, 2, 11, true ], [ 8, 3, 2, true ],
  [ 9, 3, 7, false ], [ 10, 3, 8, false ], [ 11, 6, 5, true ], [ 12, 6, 7, true ],
  [ 13, 8, 1, true ], [ 14, 9, 2, true ], [ 15, 11, 10, true ]
]

posts_list = [
  [ 1, "Nobody has ever achieved more than this administration.", 7 ],
  [ 2, "My password is 123456, what's yours guys?", 2 ],
  [ 3, "I am dumb lol", 2 ],
  [ 4, "I drink others piss from public urinal deuces", 2 ],
  [ 5, "C'mon leave my brother be. He's retarded", 1],
  [ 6, "I just want to say that my granny isn't frog. Just so you know. ", 12],
  [ 7, "Been to disneyland, it was awsome!", 8],
  [ 8, "What is good against diarrhea?", 11],
  [ 9, "That new clipping album is their best to the date imo", 6],
  [ 10, "What if earth stops spinning?", 1],
  [ 11, "Covid is a liberal hoax, wake up!", 4],
  [ 12, "I miss the summer so much :(", 9],
  [ 13, "Like if you love Jesus. Amen.", 7]
]

likes_list = [
  [ 1, 5, 1 ], [ 2, 3, 1 ], [ 3, 4, 2 ], [ 4, 6, 2 ], [ 5, 5, 2 ], [ 6, 8, 2 ],
  [ 7, 9, 2 ], [ 8, 10, 2 ], [ 9, 11, 2 ], [ 10, 2, 2 ], [ 11, 2, 3 ], [ 12, 2, 4 ],
  [ 13, 9, 4 ], [ 14, 10, 4 ], [ 15, 6, 4 ], [ 16, 3, 6 ], [ 17, 3, 13 ], [ 18, 5, 13 ]
]

comments_list = [
  [ 1, 3, 1, "Only the next one will. MAGA!" ],
  [ 2, 7, 1, "Absolutely Jon, let's stop the left from destroying our country" ],
  [ 3, 5, 6, "Go to your bedroom freddie." ],
  [ 4, 2, 1, "Hey, guys, want to go to disneyland?" ],
  [ 5, 4, 8, "try some desinfectant" ],
  [ 6, 9, 9, "Is it? Got to listen to it." ], 
  [ 7, 11, 9, "idk the TEATB is better imo" ],
  [ 8, 6, 9, "just give it a chance it will grow on you" ],
  [ 9, 3, 13, "Amen" ],
  [ 10, 7, 13, "amen" ],
  [ 11, 4, 13, "MAGA!" ],
  [ 12, 2, 13, "AEMN!!!!!" ]
]

User.all.destroy_all
users_list.each do |id, username, email, password|
  User.create!(id: id,
    username: username,
    email: email,
    password: password)
end

friend_requests_list.each do |id, requestor_id, receiver_id, accepted|
  FriendRequest.create!(id: id,
    requestor_id: requestor_id,
    receiver_id: receiver_id,
    accepted: accepted)
end

friendships_list = friend_requests_list.each do |friend_request|
  if friend_request.any?(true)
    Friendship.create!(friend_id: friend_request[1],
      inverse_friend_id: friend_request[2],
      friend_request_id: friend_request.first)
  end
end

posts_list.each do |id, body, user_id|
  Post.create!(id: id,
    body: body,
    user_id: user_id)
end

likes_list.each do |id, user_id, post_id|
  Like.create!(id: id,
    user_id: user_id,
    post_id: post_id)
end

comments_list.each do |id, user_id, post_id, body|
  Comment.create!(id: id,
    user_id: user_id,
    post_id: post_id,
    body: body)
end

