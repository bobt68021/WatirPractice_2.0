require 'watir-webdriver'

Before('@skip') do
  pending
end

Before do
  @browser = Watir::Browser.new :chrome
end

After do
  sleep 2
  @browser.close
end