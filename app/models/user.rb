class User < ActiveRecord::Base
  has_many :favorites, :dependent => :destroy
  has_many :favorite_listings, through: :favorites, source: :listing

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
