namespace :importer do
  desc "Get listing"
  task get_listing: :environment do
    Importer::EtsyListing.get_listing
  end

end
