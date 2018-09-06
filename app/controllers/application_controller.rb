class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :redirect_to_profile_page, only: [:root]

  include SessionsHelper

  def redirect_to_profile_page
    if logged_in?
      redirect_to_user
    end
  end
  
  private
    def logged_in_user
    	unless logged_in?
    		store_location
    		flash[:danger] = "Please log in"
    		redirect_to login_url
    	end
    end

end
