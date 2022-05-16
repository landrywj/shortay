# frozen_string_literal: true

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

ENV['RAILS_ENV'] ||= 'test'
require 'rspec/rails'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.profile_examples = 5
  config.order = :random
  config.disable_monkey_patching!
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.fixture_path = Rails.root / 'spec' / 'fixtures'
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  Kernel.srand config.seed
end

ActiveRecord::Migration.maintain_test_schema!
