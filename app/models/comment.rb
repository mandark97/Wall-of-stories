# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :text
#  story_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :story
  has_one :user
end
