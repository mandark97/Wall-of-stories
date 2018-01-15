class UserPolicy < ApplicationPolicy
  attr_reader :user, :friend

  def initialize(user, friend)
    @user = user
    @friend = friend
  end

  def friend?
    friend.in? user.friends
  end

  def friend_pending?
    FriendConnection.find_by(friend: user, user: friend)&.pending?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
