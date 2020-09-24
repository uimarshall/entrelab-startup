class ProfilesController < ApplicationController
    # GET to /users/:user_id/profile/new
 
    def new
        # Render blank profile details form
        # We can initantialize instance variables in our controller and make it available in the views
        @profile = Profile.new
        
    end
end