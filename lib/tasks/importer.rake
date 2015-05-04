namespace :importer do
  desc "Get listing"
  task :get_listing, [:id] => :environment do |task, args|
    Importer::EtsyListing.get_listing(args.id)
  end


  desc "Generate Listings from JSON file"
  task load_listings: :environment do
    etsy_listings = YAML.load(File.read(Rails.root.to_s + ('/db/listings.yml')))
    etsy_listings.each do |etsy_listing|
      listing = Listing.find_by_etsy_listing_id etsy_listing["etsy_listing_id"]
      if listing.nil?
        puts "going to creating listing..."
        Importer::EtsyListing.get_listing(etsy_listing["etsy_listing_id"])
        puts "listing created"
      else
        puts "already exists"
      end
      # storage_location = StorageLocation.find_by_name location["name"]
      # if storage_location.nil?
      #   puts "Inserting #{location["name"]}"
      #   storage_location = StorageLocation.new(name: location["name"])
      #   storage_location.address = Address.new(location["address"])
      #   storage_location.save
      # else
      #   puts "Storage Location: #{ location["name"]} aleady exists"
      # end
    end
  end

# desc "Get listing"
# task get_listing: :environment do
#   Importer::EtsyListing.get_listing
# end


end
