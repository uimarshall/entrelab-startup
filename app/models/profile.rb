# The Profile model programmatically has access to all the fields in the profile schema
class Profile < ActiveRecord::Base
    belongs_to :user
     has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
end