# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  status     :integer          default(0), not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_portfolios_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class Portfolio < ApplicationRecord
  belongs_to :profile

  validate :name, presence: true, length: { maximum: 255 }
  validate :url, length: { maximum: 255 }

  enum status: { untouched: 0, ongoing: 1, released: 2 }
end
