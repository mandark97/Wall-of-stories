class AlbumPolicy < ApplicationPolicy
  attr_reader :user, :album

  def initialize(user, album)
    @user = user
    @album = album
  end

  def can_edit?
    return true if user.admin?
    album.in? user.albums
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
