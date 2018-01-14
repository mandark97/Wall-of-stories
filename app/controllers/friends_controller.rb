class FriendsController < ApplicationController
  def index
    if params[:search]
      @friends = User.all
    else
      @friends = current_user.friends
    end
  end

  def requests

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
