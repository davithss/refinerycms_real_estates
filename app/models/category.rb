class Category < ActiveRecord::Base

  acts_as_indexed :fields => [:title]

  validates :title, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :real_estates
  
end
