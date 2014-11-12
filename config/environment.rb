# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = "71c2e2a28e48816e77ea1aa907297cb4"
end

# Initialize the Rails application.
Rails.application.initialize!
