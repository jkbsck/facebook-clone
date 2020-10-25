class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :friend_a, references: :users, foreign_key: { to_table: :users }
      t.references :friend_b, references: :users, foreign_key: { to_table: :users }
      t.references :friend_request, references: :friend_requests, foreign_key: { to_table: :friend_requests }

      t.timestamps
    end
  end
end
