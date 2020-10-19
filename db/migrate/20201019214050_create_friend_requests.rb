class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :requestor, references: :users, foreign_key: { to_table: :users }
      t.references :receiver, references: :users, foreign_key: { to_table: :users }
      t.boolean :accepted, null: false, default: false

      t.timestamps
    end
  end
end
