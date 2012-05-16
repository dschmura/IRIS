class PagesController < ApplicationController
  skip_filter :redirect_https
  def home
    @page_title="Home"

  end

  def contact
    @page_title="Contact Us"
  end
  
  def about
    @page_title="About Us"
  end
  
  def faq
    @page_title="Frequently Asked Questions"
  end
  
  def event_support
    @page_title="Event Support"
  end
  
  def help
    @page_title="Help"
  end
  def development
    @page_title="Development"
  end

  def admin
    @page_title="Administration Jump Page"
  end



end