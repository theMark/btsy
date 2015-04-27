class Listing < ActiveRecord::Base


def css_image_url
  bg_url = main_image_url.sub(/^https?\:/, '')
end

end
