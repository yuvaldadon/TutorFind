class UsersController < ApplicationController
  #before_action :authenticate_user!
  # GET to /users/:id
  def show
    
    # show if profile exists
    if Profile.where(user_id: params[:id]).exists?
      @user = User.find( params[:id] )
      
    elsif (current_user.id.to_s==params[:id].to_s)
        redirect_to new_user_profile_path(user_id: current_user.id)
    else
        redirect_to root_path
    end
  end
  
  def index
    @users = User.includes(:profile)
  end
end