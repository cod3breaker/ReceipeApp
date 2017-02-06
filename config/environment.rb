# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# following line is the fix for the error Recipe.all in Rails Console
require 'carrierwave/orm/activerecord'
