class Admin::PhotosController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery :except => "create"
  def index
    @photos = Photo.all
  end


  def create
      params[:picture] = {}
      params[:picture][:image] = params[:Filedata]
      params[:picture][:photo_gallery_id] = params[:album_id]
      
      @photo = Photo.new(params[:picture])

  
      if @photo.save and
        render :text => "1"
      else
        render :text => "0"
      end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo_gallery = @photo.photo_gallery
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to edit_admin_photo_gallery_path(@photo_gallery)
  end
end
