class Retailer < ActiveRecord::Base
  has_many :offers
  mount_uploader :logo, RetailerLogoUploader
end
