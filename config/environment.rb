# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Minepenger::Application.initialize!

# Loads APP_CONFIG from config.yml
require 'ostruct'
APP_CONFIG = OpenStruct.new(YAML.load_file("#{Rails.root.to_s}/config/config.yml")[RAILS_ENV])
