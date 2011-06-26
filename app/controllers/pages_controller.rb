class PagesController < ApplicationController
  def home
    @title = "Home"
    if user_signed_in?
      redirect_to current_user
    end
    @bikes = Bike.find(:all, :limit => 8, :order => "created_at DESC")
  end

  def help
    @title = "Help"
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

  def terms
    @title = "Terms and Conditions"
  end

end
