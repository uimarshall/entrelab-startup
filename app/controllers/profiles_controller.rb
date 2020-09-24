class ProfilesController < ApplicationController
    # GET to /users/:user_id/profile/new
    def new
        # Render blank profile details form
        # We can initantialize instance variables in our controller and make it available in the views
        @profile = Profile.new
        
    end
    # POST   /users/:user_id/profile
    def create
        # Ensure we have the user filling out the form
        @user = User.find(params[:user_id])
        # create profile associated with this specific user
        # we use '@user.build_profile' bcos a user 'has_one' profile
        # we will use '@user.profiles.build' for a user 'has_many' profiles
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = 'Profile Successfully created'
            redirect_to root_path
        else 
            render action: :new   
            
        end
        # Only this whitelisted fields can go to out db
       
        
    end
     private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
            
            
        end
    
end