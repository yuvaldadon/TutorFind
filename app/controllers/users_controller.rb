class UsersController < ApplicationController
  #before_action :authenticate_user!
  # GET to /users/:id
  def show
    if Profile.where(user_id: params[:id]).exists?
      @user = User.find( params[:id] )
    else
      if (user_signed_in?) && (current_user.id==params[:id])
        redirect_to new_user_profile_path(user_id: current_user.id)
      else
        redirect_to root_path
      end
    end
  end
  
  def index
    @users = User.includes(:profile)
  end
end