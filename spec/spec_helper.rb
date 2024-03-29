# frozen_string_literal: true

require 'dotenv/load'
require 'capybara/rspec'
require 'require_all'
require 'selenium-webdriver'
require 'json'
require 'site_prism'

require_all 'models'
require_all 'page_objects/sections/'
require_all 'page_objects/pages/'
require_all 'spec/support'

include FeatureHelper
include FileHelper
include ApiWrapper

RSpec.configure do
  def options
    Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
  end

  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end
