# Run Coverage report
require 'simplecov'
SimpleCov.start do
  add_filter 'spec/dummy'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'
  add_group 'Libraries', 'lib'
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('dummy/config/environment.rb', __dir__)

require 'solidus_frontend'
require 'rspec/rails'
require 'database_cleaner'
require 'ffaker'
require 'sunspot_test/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

# Requires factories and other useful helpers defined in spree_core.
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'spree/api/testing_support/helpers'
require 'spree/testing_support/preferences'
require 'spree/api/testing_support/setup'
# require 'sunspot/rails/spec_helper'
# require 'sunspot-rails-tester'

# require_relative 'support/sunspot'

# Requires factories defined in lib/solidus_solr/factories.rb
require 'solidus_solr/factories'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # Infer an example group's spec type from the file location.
  config.infer_spec_type_from_file_location!
  config.infer_base_class_for_anonymous_controllers = false
  config.use_transactional_fixtures = false

  # == URL Helpers
  config.include FactoryBot::Syntax::Methods
  config.include Spree::Api::TestingSupport::Helpers, type: :controller
  config.extend  Spree::Api::TestingSupport::Setup, type: :controller
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.include Spree::TestingSupport::UrlHelpers
  config.extend Spree::TestingSupport::AuthorizationHelpers::Request, type: :request
  config.include Spree::TestingSupport::Preferences, type: :controller
  config.include Spree::TestingSupport::Preferences, type: :model

  # == Mock Framework
  config.mock_with :rspec
  config.color = true

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Capybara javascript drivers require transactional fixtures set to false, and we use DatabaseCleaner
  # to cleanup after each test instead.  Without transactional fixtures set to false the records created
  # to setup a test will be unavailable to the browser, which runs under a separate server instance.
  config.use_transactional_fixtures = false
  config.fail_fast = ENV['FAIL_FAST'] || false
  config.order = 'random'
end
