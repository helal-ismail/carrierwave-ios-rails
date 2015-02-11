ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f  }

require 'rspec/rails'
require 'database_cleaner'
require 'factory_girl_rails'
require 'faker'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Request::JsonHelpers, type: :controller

  config.order = 'random'
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # DB Cleaning strategies ---------------------
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
  # DB Cleaning strategies ---------------------

  config.after(:all) do
    FileUtils.rm_rf("#{Rails.root}/tmp/spec")

    if Rails.env.test?
      FileUtils.rm_rf("#{Rails.root}/public/uploads/test")
    end
  end
end

def fixture_file(filename)
  return '' if filename.blank?
  file_path = File.expand_path(Rails.root + 'spec/fixtures/' + filename)
  File.new(file_path)
end

def freeze_time(now = Time.now)
  datetime = DateTime.parse(now.to_s)
  time = Time.parse(now.to_s)

  allow(DateTime).to receive(:now) { datetime }
  allow(Time).to receive(:now) { time }
end
