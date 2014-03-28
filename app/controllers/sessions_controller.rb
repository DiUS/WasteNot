class SessionsController < ApplicationController
  def set_charity
    session[:c_org] = Charity.find(params[:id])
    session[:r_org] = nil
    redirect_to offers_path
  end

  def set_retailer
    session[:r_org] = Retailer.find(params[:id])
    session[:c_org] = nil
    redirect_to offers_path
  end

  def unset_org
    session[:r_org] = nil
    session[:c_org] = nil
    redirect_to root_path
  end
end