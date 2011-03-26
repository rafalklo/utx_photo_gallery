class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :original => "720x720", :medium => "360x360", :thumb => "180x180^"}
  belongs_to :photo_gallery
  # Mass assign doesnt work with protected attributes
  # attr_accessible :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :photo_gallery_id
  
end
