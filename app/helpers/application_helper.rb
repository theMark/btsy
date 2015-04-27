module ApplicationHelper

  def etsy_listing_url(id)
    url = "http://www.etsy.com/listing/#{id}"
    return url
  end

end
