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
    def self.get_listing
      Importer::EtsyListing.connect
      listing = Etsy::Listing.find(157583414)
      puts listing.inspect


    end


  end
end
