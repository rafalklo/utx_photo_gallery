class Admin::PhotoGalleriesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @photo_galleries = PhotoGallery.all
  end

  def show
    @photo_gallery = PhotoGallery.find(params[:id])
  end

  def new
    @photo_gallery = PhotoGallery.new
  end

  def create
    @photo_gallery = PhotoGallery.new(params[:photo_gallery])
    if @photo_gallery.save
      flash[:notice] = "Successfully created photo gallery."      
      #redirect_to(admin_photo_galleries_path, :notice => t('flash.page_created'))
      #redirect_to(:controller => "uploader", :action => "index", :id => @album.id, :notice => 'Album was successfully created.')
      redirect_to edit_admin_multi_uploader_path(@photo_gallery.id)
      
    else
      render :action => 'new'
    end
  end

  def edit
    @photo_gallery = PhotoGallery.find(params[:id])
  end

  def update
    @photo_gallery = PhotoGallery.find(params[:id])
    if @photo_gallery.update_attributes(params[:photo_gallery])
      flash[:notice] = "Successfully updated photo gallery."
      redirect_to admin_photo_galleries_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photo_gallery = PhotoGallery.find(params[:id])
    @photo_gallery.destroy
    flash[:notice] = "Successfully destroyed photo gallery."
    redirect_to admin_photo_galleries_path
  end
end
