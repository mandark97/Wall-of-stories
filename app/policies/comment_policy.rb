class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def can_edit?
    true if user.admin?
    true if comment.in? Comment.joins(story: [album: [:user]]).where('users.id': user.id)
    true if comment.user_id == user.id

    false
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
