class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def can_edit?
    true if user.admin?
    true if story.in? Story.joins(album: [:user]).where('users.id': user.id)

    false
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
