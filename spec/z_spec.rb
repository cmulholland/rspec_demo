require "spec_helper.rb"
require "support/capybara.rb"
require "support/helpers.rb"
require "csv"

#get the Helpers module
RSpec.configure do |c|
  c.include Helpers
  c.include Capybara::DSL
  #c.fail_fast = true
end

describe "Just visits" do
  before(:each) do
    #sleep 2
  end
  after(:each) do
    #sleep 1
  end
  it "visits Google and expect to see the word Gmail" do
    visit "https://www.google.com"
    expect(page).to have_content("GmailX")
  end
  
end
