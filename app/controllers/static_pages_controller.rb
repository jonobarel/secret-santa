class StaticPagesController < ApplicationController
  before_action :redirect_to_profile_page, only: [:home]

  def redirect_to_profile_page
    if logged_in?
      redirect_to current_user
    end
  end
  

  def home
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
