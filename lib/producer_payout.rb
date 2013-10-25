require 'producer_payout/version'
require 'active_record'
require_relative 'producer_payout/models/video.rb'
require_relative 'producer_payout/models/video_view.rb'
require_relative 'producer_payout/models/subscription.rb'
require_relative 'producer_payout/models/producer.rb'

project_root = File.dirname(File.absolute_path(__FILE__))
config_file = File.join(project_root, 'config', 'database.yml')

connection_details = YAML::load(File.open(config_file))
ActiveRecord::Base.establish_connection(connection_details)

module ProducerPayout
  # Your code goes here...
end
