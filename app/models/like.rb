class Like < ApplicationRecord
  # user can only liked once on a server side
  validates_uniqueness_of :user_id, scope: :post_id

  belongs_to :user
  belongs_to :post
end
