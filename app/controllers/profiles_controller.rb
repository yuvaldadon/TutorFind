class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    # GET to /users/:user_id/profile/new
    def new
        @profile = Profile.new
    end
    
    # POST
    def create
        @user = User.find(params[:user_id])
        @profile = @user.build_profile(profile_params)
        
        if @profile.save
            flash[:success] = "Profile Added"
            redirect_to user_path( params[:user_id] )
        else
            render action: :new
        end
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
        
        def only_current_user
            @user=User.find(params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
end