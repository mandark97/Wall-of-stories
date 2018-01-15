class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def can_edit?
    true if user.admin?
    true if comment.in? user.albums.map { |album| album.stories.map(&:comments) }
    true if comment.user_id == user.id

    false
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
