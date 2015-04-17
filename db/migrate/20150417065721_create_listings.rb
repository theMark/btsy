class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :etsy_user_id
      t.string :price
      t.integer :etsy_listing_id
      t.string  :main_image_url

      t.timestamps null: false
    end
  end
end
