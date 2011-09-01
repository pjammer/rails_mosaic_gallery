module ActionView
  module Helpers
    #First you require the scripts, then you can use the mosaic tag.
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
        
    # You need an image url, pick a mosaic plugin 'theme', a link to link to and content for those that need it.
    def mosaic_tag(path_to_image, mosaic_option, link_address, content = {})
      #pass an object and a mosaic option in.
      %Q{
        <div class="mosaic-block #{mosaic_option}">
                 <a href="#{link_address}" class="mosaic-overlay">
                        <div class="details">
                             <h4>#{content[:heading]}</h4><br/>
          <p>#{content[:description]}</p>
                         </div>
                  </a>
          <div class="mosaic-backdrop"><img src="#{path_to_image}"/></div>
        </div>
        }.html_safe
    end
  end
end
