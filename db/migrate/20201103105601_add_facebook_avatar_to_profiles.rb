class AddFacebookAvatarToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :facebook_avatar, :boolean, null: false, default: false
  end
end
