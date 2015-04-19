require 'etsy'


module Importer
  class EtsyListing

    def self.connect
      Etsy.api_key = 'yuscd56cs51k1c3q82wlv2x2'
      Etsy.api_secret = 'au2shgiksd'
      Etsy.callback_url = 'http://localhost:4567/authorize'
      puts "connected to Etsy API"
    end

    # class method so use self.something
    def self.get_listing(etsy_listing_id)
      #connect to API
      Importer::EtsyListing.connect

      #go find this listing
      id = etsy_listing_id
      l = Etsy::Listing.find(id)

      title = l.title
      description = l.description
      etsy_listing_id = l.id
      main_image_url = l.images.first.full || cheese
      price = l.price
      etsy_user_id = l.user_id

      #FOR TESTING
      # puts title
      # puts description
      # puts etsy_listing_id
      # puts main_image_url
      # puts price
      # puts etsy_user_id


      # Create new listing if it doesn't exist
      if Listing.where(etsy_listing_id: etsy_listing_id).exists?
        puts "That listing already exists for: #{etsy_listing_id}"
      else
        @listing = Listing.create(
          title: title,
          description: description,
          etsy_listing_id: etsy_listing_id,
          main_image_url: main_image_url,
          price: price,
          etsy_user_id: etsy_user_id
          )
        puts "new listing created: #{@listing.title}"
      end










    end


  end
end
