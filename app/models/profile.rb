# The Profile model programmatically has access to all the fields in the profile schema
class Profile < ActiveRecord::Base
    belongs_to :user
    
end