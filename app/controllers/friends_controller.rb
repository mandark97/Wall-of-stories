class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = if params[:search].present?
                 User.except(user_id: current_user.id).left_joins(:user_profile)
                     .where("first_name||' '||last_name ilike (?) or email ilike (?)",
                            "%#{params[:search]}%", "%#{params[:search]}%")
               elsif params[:friends].present?
                 friend_ids = FriendConnection.where(status: :accepted, user: current_user).pluck(:friend_id)
                 User.where(id: friend_ids)
               elsif params[:requests].present?
                 user_ids = FriendConnection.where(status: :pending, friend: current_user).pluck(:user_id)
                 User.where(id: user_ids)
               else
                 User.all
               end
  end

  def requests
    @friends = FriendConnection.where(friend: current_user, status: :pending).pluck(:user)
  end

  def new
    friend = User.find(params[:friend_id])

    FriendConnection.create(user: current_user, friend: friend, status: :pending)
    # FriendConnection.create(user: friend, friend: current_user, status: :pending)

    redirect_to friends_path
  end

  def create
    friend = User.find(params[:friend_id])

    FriendConnection.create(user: current_user, friend: friend, status: :accepted)
    FriendConnection.find_by(user: friend, friend: current_user).accepted!

    redirect_to friends_path
  end

  def edit

  end

  def update

  end

  def destroy
    FriendConnection.find_by(user: current_user.id, friend: params[:id])&.destroy
    FriendConnection.find_by(friend: current_user.id, user: params[:id])&.destroy

    redirect_to friends_path
  end
end
