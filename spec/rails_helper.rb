# frozen_string_literal: true

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

ENV['RAILS_ENV'] ||= 'test'
require 'rspec/rails'
require 'spec_helper'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!
