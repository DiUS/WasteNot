class Offer < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :charity
  belongs_to :category
  mount_uploader :cover_image, OfferCoverImageUploader
end
