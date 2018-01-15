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

class FriendConnection < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: { accepted: 0, pending: 1 }
end
