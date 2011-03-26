class PhotoGallery < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  attr_accessible :title, :description, :active
  validates_presence_of :title
end
