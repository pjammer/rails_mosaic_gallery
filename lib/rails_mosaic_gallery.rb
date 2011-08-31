module ActionView
  module Helpers
    #First you require the scripts, then you can use the mosaic tag.
    def mosaic_scripts(arg = 'bar2')
      %Q{
      <script type="text/javascript">
      $(function($) {
        	$('.#{arg}').mosaic({
		animation : 'slide' //fade or slide
		});
      });
      </script>
      }.html_safe
    end
    def mosaic_tag(path_to_image, mosaic_option, link_address, content = {})
      #pass an object and a mosaic option in.
      #content hash to have :heading and :paragraph in it
      div_for(:class => "mosaic-block #{mosaic_option}") do 
        link_to link_address, {:class => "mosaic-overly"} do 
          div_for(:class => "details") do 
            content_tag(:h4, content[:heading])
            content_tag(:p, content[:paragraph])
          end
        end
        div_for(:class => "mosaic-backdrop") do
          image_tag(path_to_image)
        end
      end
    end
  end
end
