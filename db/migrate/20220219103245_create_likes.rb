class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :profile_id], unique: true
  end
end
