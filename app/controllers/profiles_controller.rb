class ProfilesController < ApplicationController
    before_action :authenticate_user!
    # Check current user can edit profile
    before_action :only_current_user
    
    # GET /users/:user_id/profile/new
    def new
        @profile = Profile.new
    end
    
    # POST /users/:user_id/profile/new
    def create
        @user = User.find(params[:user_id])
        @profile = @user.build_profile(profile_params)
        # Save profile
        if @profile.save
            flash[:success] = "Profile Added"
            redirect_to user_path( params[:user_id] )
        else
            render action: :new
        end
    end
    
    # GET edit profile form
    def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
    end
    
    # PATCH profile
    def update
        @user = User.find(params[:user_id])
        @profile = @user.profile
        # Attempt update
        if @profile.update(profile_params)
            flash[:success] = "Profile Updated"
            redirect_to user_path( params[:user_id] )
        else
            render action: :edit
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