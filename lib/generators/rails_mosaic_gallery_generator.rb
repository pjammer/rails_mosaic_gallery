class RailsMosaicGalleryGenerator < Rails::Generators::Base
  desc "Description: Copies Mosaic Plugin javascript directory and css files to the proper application public directory structure, as needed by the plugin."
  def self.source_root
    @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
  end
  
  def move_files
    copy_file 'css/mosaic_plugin.css', "public/stylesheets/mosaic_plugin.css"
    directory "javascripts", 'public/javascripts/mosaic_plugin'
    directory "images", "public/images"
  end
end