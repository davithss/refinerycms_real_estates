class RealEstate < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :status]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image
  
  has_friendly_id :title, :use_slug => true
  
  has_and_belongs_to_many :categories
  
end
