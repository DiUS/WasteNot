class Charity < ActiveRecord::Base
  has_many :offers
  has_many :endorsements
end
