class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :get_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = @user.albums
  end

  def new

  end

  def create
    album = Album.new(album_params)
    album.user_id = params[:user_id]

    album.save

    redirect_to user_albums_path(@user)
  end

  def edit

  end

  def update
    @album.update(album_params)

    redirect_to user_album_path(@user, @album)
  end

  def destroy
    @album.destroy
    redirect_to user_albums_path(@user)
  end

  def show
  end

  private
  def get_album
    @album = Album.find(params[:id])
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end
