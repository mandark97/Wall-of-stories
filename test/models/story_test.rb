# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  text       :text
#  photo      :string
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :integer
#

require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
