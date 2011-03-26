class Admin::MultiUploaderController < ApplicationController  
  before_filter :authenticate_user!
  def edit    
    @photo_gallery_id = params[:id]
    @photo_gallery = nil
    if @photo_gallery_id
      @photo_gallery = PhotoGallery.find(@photo_gallery_id)
    end
    unless @photo_gallery
      redirect_to admin_photo_galleries_path
    end
  end
  
end
