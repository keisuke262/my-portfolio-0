# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# carrierwave(画像アップロード)
require 'carrierwave/orm/activerecord'