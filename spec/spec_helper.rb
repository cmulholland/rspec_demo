# spec_helper.rb

require 'bundler/setup'
Bundler.setup

# if we're using Gemfile w/ bundler, do we still need all the spec_helper requires?

require "net/http"
require "uri"
require "json"
require "selenium-webdriver"
require "rspec"
require "dotenv"
require "capybara"
require "yaml"

require 'capybara/poltergeist'
# the next line uncommented on 10/26.  seems to fix uninitialized constant Capybara::DSL (NameError) error.
require 'capybara/dsl'

Dotenv.load(
  # use this to merge multiple app.env files
  # File.expand_path("../.#{APP_ENV}.env", __FILE__),
  File.expand_path("../../.env", __FILE__)
)

include RSpec::Expectations



