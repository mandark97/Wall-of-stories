class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.joins(album: [user: [:friend_connections]]).where('friend_connections.friend_id': current_user.friends.pluck(:id))
  end

  def new
  end

  def create
    Story.create!(story_params)

    redirect_to stories_path
  end

  def show
  end

  def edit
  end

  def update
    @story.update(story_params)
    redirect_to story_path(@story)
  end

  def destroy
    @story.destroy

    redirect_to stories_path
  end

  private
  def find_story
    @story = Story.find(params[:id])
  end

  private
  def story_params
    params.require(:story).permit(:text, :photo, :album_id)
  end
end
