class SessionsController < ApplicationController

skip_before_action :require_login, only: [:create, :destroy, :new]
helper_method :current_user

 def new
 end

 def create
   user = User.find_by_email(params[:email])
   if user && user.authenticate(params[:password])
     log_in user
     remember user
     redirect_to welcome_path, :notice => "Hello, #{user.name}!"
   else
     flash.now.alert = "Invalid email or password"
     render 'new'
   end
 end


 def destroy
   log_out if logged_in?
   redirect_to root_url, :notice => "Logged out!"
 end

end
