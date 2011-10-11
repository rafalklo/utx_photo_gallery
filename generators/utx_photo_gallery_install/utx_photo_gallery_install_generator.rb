class UtxPhotoGalleryInstallGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.directory "app/middleware"
      m.template  "flash_session_cookie_middleware.rb", "app/middleware/flash_session_cookie_middleware.rb"
      
      m.migration_template 'photos.rb', 'db/migrate', :migration_file_name => "create_photos"
      m.migration_template 'photo_galleries.rb', 'db/migrate', :migration_file_name => "create_photo_galleries"
      
      m.directory "public/stylesheets"
      m.file      "../../../public/stylesheets/photo_gallery.css", "public/stylesheets/photo_gallery.css"
      
      m.directory "public/scripts"
      m.file      "../../../public/scripts/uploadify.swf", "public/scripts/uploadify.swf"
      
      m.directory "public/javascripts"
      m.file      "../../../public/javascripts/swfobject.js", "public/javascripts/swfobject.js"
      m.file      "../../../public/javascripts/jquery.uploadify.v2.1.0.min.js", "public/javascripts/jquery.uploadify.v2.1.0.min.js"
      m.file      "../../../public/javascripts/jquery.colorbox.min.js", "public/javascripts/jquery.colorbox.min.js"
      
      m.directory "public/images/uploadify"
      m.file      "../../../public/images/uploadify/cancel.png", "public/images/uploadify/cancel.png"
      
      m.directory "public/images/colorbox"
      m.directory "public/images/colorbox/internet_explorer"

      colorbox = File.join(spec.path, '..', '..', 'public', 'images', 'colorbox')
      
      Dir[File.join(colorbox, "**/*")].each do |file|
        file = file.gsub(colorbox, "")[1..-1]   
        unless File.directory? "public/images/colorbox/#{file}"
          m.file       "../../../public/images/colorbox/#{file}", "public/images/colorbox/#{file}"
        end
      end      
      
      m.readme "README"
      puts "Done!"
    end
  end

end
