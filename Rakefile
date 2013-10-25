#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rake/testtask'
require 'sqlite3'
require 'active_record'
require 'yaml'

Rake::TestTask.new do |t|
  t.libs << 'lib/producer_payout'
  t.test_files = FileList['test/lib/producer_payout/*_test.rb']
  t.verbose = true
end

task default: :test

namespace :db do

  desc 'Migrate the db'
  task :migrate do
    connection_details = YAML::load(File.open('lib/config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

  desc 'seed the db with test data'
  task :seed do
    connection_details = YAML::load(File.open('lib/config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    load 'db/seeds.rb'
  end
end
