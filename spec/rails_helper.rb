ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'
require 'capybara/rails'
require 'selenium-webdriver'
require 'capybara/rspec'
Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods

  config.include ActionDispatch::TestProcess

  FactoryGirl::SyntaxRunner.class_eval do
    include ActionDispatch::TestProcess
  end

  config.include Devise::TestHelpers, :type => :controller
  config.include Capybara::DSL
end
