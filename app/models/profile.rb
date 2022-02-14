# == Schema Information
#
# Table name: profiles
#
#  id                :bigint           not null, primary key
#  avatar            :string
#  birthplace_code   :integer
#  blood_type        :integer          default(0), not null
#  date_of_birth     :date
#  gender            :integer          default(0), not null
#  grade             :integer          not null
#  hobby             :text             not null
#  living_place_code :integer
#  name              :string           not null
#  self_introduce    :text             not null
#  siblings_relation :integer          default(0), not null
#  team_dev_will     :integer          default(0), not null
#  times_name        :string
#  twitter_account   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user
  has_many :portfolios
  mount_uploader :avatar, AvatarUploader

  validate :name, presence: true, length: { maximum: 255 }
  validate :grade, presence: true
  validate :hobby, presence: true, length: { maximum: 65_535 }
  validate :self_introduce, presence: true, length: { maximum: 65_535 }

  enum gender: { unanswered: 0, male: 1, female: 2, others: 3 }
  enum blood_type: { unanswered: 0, A: 1, B: 2, O: 3, AB: 4 }
  enum siblings_relation: { unanswered: 0, oldest: 1, middle: 2, youngest: 3, have_no_siblings: 4 }
  enum team_dev_will: { unanswered: 0, not_available: 1, would_love_to: 2, interested_but: 3 }

  include JpPrefecture
  jp_prefecture :birthplace_code, method_name: :birthplace
  jp_prefecture :living_place_code, method_name: :living_place
end
