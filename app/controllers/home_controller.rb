class HomeController < ApplicationController
  
  # default home page
  def index
    @user = current_user
    if user_signed_in?
      @filers = @user.filers
    end
  end
  
end
