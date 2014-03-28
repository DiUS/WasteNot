class Retailer < ActiveRecord::Base
  has_many :offers
  has_many :endorsements
  mount_uploader :logo, RetailerLogoUploader
end
