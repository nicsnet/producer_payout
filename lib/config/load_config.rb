require 'active_record'
require 'yaml'
ActiveRecord::Base.establish_connection(YAML.load_file('database.yml'))
