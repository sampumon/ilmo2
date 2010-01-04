# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # include Authorization

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :calculate_page_loaded, :set_locale, :find_user

protected
  def calculate_page_loaded
    @page_loaded = I18n.l Time.now
  end
  
  def set_locale
    I18n.locale = params[:lang]
  end

  def find_user
    if session[:user_id]
      @logged_user = User.find(session[:user_id]) 
      Authorization.current_user = @logged_user
    end
  end
end
