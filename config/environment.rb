ENV['RAILS_RELATIVE_URL_ROOT'] = '/webui'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Graylog2WebInterface::Application.initialize!
