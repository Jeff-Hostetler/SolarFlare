class PublicController < ApplicationController
  skip_before_action :confirm_logged_in
  skip_before_action :confirm_current_user
end
