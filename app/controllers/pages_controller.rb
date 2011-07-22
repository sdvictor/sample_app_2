class PagesController < ApplicationController
  def index
  end
  
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"    
  end
  
  def help
    @title = "Help"
  end
  
  def sign_in
  end

end
