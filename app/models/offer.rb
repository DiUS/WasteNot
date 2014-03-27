class Offer < ActiveRecord::Base
  belongs_to :Charity
  mount_uploader :cover_image, OfferCoverImageUploader
end
