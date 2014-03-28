class Endorsement < ActiveRecord::Base
  belongs_to :charity
  belongs_to :retailer
end
