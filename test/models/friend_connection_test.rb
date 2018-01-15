# == Schema Information
#
# Table name: friend_connections
#
#  id         :integer          not null, primary key
#  status     :integer
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FriendConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
