module OffersHelper

  def can_create_offer
    !session[:r_org].nil?
  end
end
