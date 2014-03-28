module OffersHelper

  def can_create_offer
    !session[:r_org].nil?
  end

  def can_accept_offers
    !session[:c_org].nil?
  end
end
