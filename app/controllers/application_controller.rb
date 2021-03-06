class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :require_login

  helper_method :dollars


 include SessionsHelper

  def dollars
    '%.2f' % (self / 100)
  end


 private

 def require_login
   unless logged_in?
     flash[:error] = "You must be logged in to access this section"
     redirect_to root_path # halts request cycle
   end
 end
 
end
