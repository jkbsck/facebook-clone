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
  [ 1, 1, 2, false ], [ 2, 1, 4, false ], [ 3, 1, 5, false ], [ 4, 1, 9, true ],
  [ 5, 2, 4, false ], [ 6, 2, 10, true ], [ 7, 2, 11, false ], [ 8, 3, 2, false ],
  [ 9, 3, 7, false ], [ 10, 3, 8, false ], [ 11, 6, 5, true ], [ 12, 6, 7, false ],
  [ 13, 8, 1, true ], [ 14, 9, 2, false ], [ 15, 11, 10, false ]
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

