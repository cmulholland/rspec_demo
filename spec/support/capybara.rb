require "selenium-webdriver"

Capybara.default_max_wait_time = 2

@test_driver = ENV["TEST_DRIVER"]
puts "#{@test_driver} is the test driver"

if @test_driver == "headless_chrome"
  Capybara.register_driver :headless_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(
      args: %w[headless disable-gpu no-sandbox window-size=1920,1080],
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end
if @test_driver == "chrome"
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end



#lets you set different default drivers.
if @test_driver == "selenium"
  Capybara.default_driver = :selenium
elsif @test_driver == "poltergeist"
  Capybara.default_driver = :poltergeist
elsif @test_driver == "browserstack"
  Capybara.default_driver = :browserstack
elsif @test_driver == "saucelabs"
  Capybara.default_driver = :saucelabs
elsif @test_driver == "chrome"
  Capybara.default_driver = :chrome
elsif @test_driver == "headless_chrome"
  Capybara.default_driver = :headless_chrome
  Capybara.javascript_driver = :headless_chrome
end

Capybara.javascript_driver = :chrome
