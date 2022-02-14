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
require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
