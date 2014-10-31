class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def confirm_logged_in
    unless logged_in?
        flash[:notice] = "Please log in to view that page"
        redirect_to :root
        return false
    else
        return true
    end
  end

end
