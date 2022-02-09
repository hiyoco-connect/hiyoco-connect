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
#
class Profile < ApplicationRecord
  belongs_to :user
end
