class HomeController < ApplicationController
  
  # default home page
  def index
    @user = current_user
    if user_signed_in?
      @filer = @user.filer
      @treasurer = @filer.treasurer unless @filer.blank?
    end
  end
  
end
