class Category < ActiveRecord::Base

  acts_as_indexed :fields => [:title]

  validates :title, :presence => true, :uniqueness => true
  
end
