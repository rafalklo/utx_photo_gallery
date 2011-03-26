class PhotoGalleriesController < ApplicationController
  def index
    @photo_galleries = PhotoGallery.find(:all, :conditions => {:active => true})
  end
  
  def show
    @photo_gallery = PhotoGallery.find(params[:id])
  end
end
