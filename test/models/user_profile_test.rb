# == Schema Information
#
# Table name: user_profiles
#
#  id          :integer          not null, primary key
#  description :text
#  first_name  :string
#  last_name   :string
#  photo       :string
#  private     :boolean
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
