class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  #after_filter :verify_authorized, except: :index

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

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

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private  
    def mobile_device?  
      request.user_agent =~ /Mobile|webOS/  
    end

  def user_not_authorized
    #flash[:alert] = "Access denied. Please log in to continue"
    flash[:alert] = "You are not able to #{params[:action]} this #{params[:controller].singularize}. Please log in to continue"
    redirect_to (request.referrer || new_user_session_path)
  end
    helper_method :mobile_device?
end
