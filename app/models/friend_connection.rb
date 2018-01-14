class FriendConnection < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: { accepted: 0, pending: 1 }
end
