class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def can_edit?
    true if user.admin?
    true if story.in? user.albums.map(&:stories)

    false
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
