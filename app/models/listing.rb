class Listing < ActiveRecord::Base

  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user

  def css_image_url
    bg_url = main_image_url.sub(/^https?\:/, '')
  end

end
