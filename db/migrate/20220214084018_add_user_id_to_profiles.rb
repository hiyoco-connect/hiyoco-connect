class AddUserIdToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :user, foreign_key: true
  end
end
