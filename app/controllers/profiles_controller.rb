class ProfilesController < ApplicationController
  before_action :get_user

  def new
  end

  def create
    user_profile = @user.build_user_profile(profile_params)

    if user_profile.save
      redirect_to user_profile_path(@user)
    else
      flash[:error] = 'Invalid data'
      redirect_to new_user_profile(@user)
    end
  end

  def show
  end

  def edit
    @user_profile = @user.user_profile
  end

  def update
    if @user.user_profile.update(profile_params)
      redirect_to user_profile_path(@user)
    else
      flash[:error] = 'Invalid data'
      redirect_to edit_user_profile(@user)
    end
  end

  def destroy
    # code here
  end

  private
  def get_user
    @user = User.find_by(id: params[:user_id])
  end

  def profile_params
    params.require(:user_profile).permit([:first_name, :last_name, :description, :photo])
  end
end
