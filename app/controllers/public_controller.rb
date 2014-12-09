class PublicController < ApplicationController
  skip_before_action :confirm_logged_in
end
