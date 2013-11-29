class ApplicationController < ActionController::Base
  protect_from_forgery
  #include SessionsHelper
  helper :all # include all helpers, all the time
  
  # Determine the IP address of the requester to @ip
  # Match the @ip using regex to a list of known campus ip addresses (NOT INCLUDING THE GUEST NETWORK)
  # If a match is not found (the requestor is off campus or not logged in)
  # force the user to use ssl (and thus requiring a kerberos login, this requirement is 
  # part of the server setup.)
  # The list of campus network blocks is available http://www.itcom.itd.umich.edu/backbone/umnet/

  def redirect_https        
    @ip = request.remote_ip     
    redirect_to :protocol => "https://" unless (request.ssl? || @ip.match(/141.211.|67.194.|35.1.|35.2.|141.212.|141.213.|141.214.|141.215.|192.168.1.|127.0.0.1/))
    return true
  end
      before_filter :redirect_https

  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end

  private  
    def mobile_device?  
      request.user_agent =~ /Mobile|webOS/  
    end  
    
    helper_method :mobile_device?
end
