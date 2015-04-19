namespace :importer do
  desc "Get listing"
  task :get_listing, [:id] => :environment do |task, args|
    Importer::EtsyListing.get_listing(args.id)
  end


# desc "Get listing"
# task get_listing: :environment do
#   Importer::EtsyListing.get_listing
# end


end
