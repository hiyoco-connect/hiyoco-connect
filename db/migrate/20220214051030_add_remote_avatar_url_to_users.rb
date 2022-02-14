class AddRemoteAvatarUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :remote_avatar_url, :string
  end
end
