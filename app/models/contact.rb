class Contact < ActiveRecord::Base
  # Any object you want your applicatn to work with is stored here
  # e.g A User object whenever a user signs up will contain an array of objects
  # The model file is the blue print for our objects,used in creating objects
  validates :name, presence: true, length: { maximum: 120 }
  validates :email, presence: true, length: { maximum: 25 }
  validates :comments, presence: true, length: { maximum: 1200 }
end
