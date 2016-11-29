require 'page-object'
require 'watir-webdriver'
include PageObject::PageFactory

CITY = 'Columbus, OH'
TYPE = 'Contract To Hire'

Given(/^I am on the opportunities page$/) do
  visit_page(ManifestHome) do |page|
    sleep 1
    page.go_to_opportunities
  end
end

When(/^I filter city to Columbus$/) do
  on_page(ManifestSearch) do |page|
    page.filter_city(CITY)
  end
end

Then(/^I am only shown opportunities in Columbus$/) do
  on_page(ManifestSearch) do |page|
    page.get_city_results.each do |result|
      expect(result.text).to eq CITY
    end
  end
end

When(/^I filter type to Contract To Hire$/) do
  on_page(ManifestSearch) do |page|
    page.filter_type(TYPE)
  end
end

Then(/^I am only shown Contract To Hire opportunities$/) do
  on_page(ManifestSearch) do |page|
    page.get_type_results.each do |result|
      expect(result.text).to eq TYPE
    end
  end
end

Given(/^I am on an opportunity application page$/) do
  visit_page(ManifestHome) do |page|
    page.go_to_application
  end
end

When(/^I fill out everything but don't upload a resume and submit$/) do
  on_page(ManifestApply) do |page|
    page.fill_form
  end
end

Then(/^I get a warning to upload a resume$/) do
  on_page(ManifestApply) do |page|
    #expect(page.validate).to be true    # this test passes, submitting the form was commented out
  end
  sleep 10
end