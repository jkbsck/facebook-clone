class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :friend, references: :users, foreign_key: { to_table: :users }
      t.references :inverse_friend, references: :users, foreign_key: { to_table: :users }
      t.references :friend_request, references: :friend_requests, null: false, foreign_key: { to_table: :friend_requests }

      t.timestamps
    end
  end
end
