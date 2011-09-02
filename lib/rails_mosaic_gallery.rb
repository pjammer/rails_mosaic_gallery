module ActionView
  module Helpers
    #First you require the scripts, then you can use the mosaic tag.
    #Example using an image uploaded via the paperclip gem:
    <<-EOL
    <%= mosaic_scripts %>
    <% @shops.each do |shop| %>
      <%= mosaic_tag(shop.logo.url(:medium),
  		    "bar2",
  		    shop_path(shop.name),
  		    {:heading => shop.name, :description =>(truncate(shop.description, :length => 30)) })  %>
    <% end %>
    EOL
    def mosaic_scripts(arg = 'bar2')
      %Q{
<link href="/stylesheets/mosaic_plugin.css" media="screen" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="/javascripts/mosaic_plugin/mosaic.1.0.1.min.js"></script>
      <script type="text/javascript">
      $(function($) {
        	$('.#{arg}').mosaic({
		animation : 'slide' //fade or slide
		});
      });
      </script>
      }.html_safe
    end
      #content hash to have :heading and :paragraph in it
    def mosaic_tag(path_to_image, mosaic_option, link_address, content = {})
      content_tag(:div, :class => "mosaic-block #{mosaic_option}") {
        content_tag(:a, {:href => link_address, :class => "mosaic-overlay"}) {
          content_tag(:div, :class => "details") {
            content_tag(:h4, content[:heading]) + content_tag(:p, content[:description])
          }
        } + content_tag(:div, image_tag(path_to_image.to_s), {:class => "mosaic-backdrop"})
      }
    end
  end
end
