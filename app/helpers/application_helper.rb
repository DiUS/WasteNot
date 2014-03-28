module ApplicationHelper

  def org
    return session[:c_org] unless session[:c_org] == nil
    return session[:r_org] unless session[:r_org] == nil
  end

end
