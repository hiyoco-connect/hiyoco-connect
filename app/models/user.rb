# == Schema Info
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  crypted_password  :string
#  email             :string           not null
#  github_name       :string
#  remote_avatar_url :string
#  salt              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_profiles, through: :likes, source: :profile

  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :authentications

  def like(profile)
    liked_profiles << profile
  end

  def unlike(profile)
    liked_profiles.destroy(profile)
  end

  def like?(like)
    liked_profiles.include?(like)
  end

  def own?(object)
    object.user_id == id
  end

  def connect
    Profile.where(id: liked_profiles.select(:profile_id)).where(id: passive_likes.select(:user_id))
  end

  def passive_likes
    Like.where(profile_id: profile.id)
  end

  def passive_liked_profiles
    Profile.where(id: passive_likes.select(:user_id))
  end
end
