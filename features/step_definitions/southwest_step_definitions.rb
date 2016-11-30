require 'watir-webdriver'
require 'page-object'
include PageObject::PageFactory

DEPARTURE_CITY = 'CLE'
ARRIVAL_CITY = 'FLL'
DEPARTURE_DATE = '02/05'
ARRIVAL_DATE = '3/6'

Given(/^I am on the booking page$/) do
  visit_page(SouthwestHome)
end

When(/^I submit flight information$/) do
  on_page(SouthwestSearch) do |page|
    page.set_dates(DEPARTURE_DATE, ARRIVAL_DATE)
    page.search_flights(DEPARTURE_CITY, ARRIVAL_CITY)
  end
end

Then(/^the default dates should be highlighted$/) do
  sleep 2
  on_page(SouthwestSearch) do |page|
    expect(page.compare_dates).to be true
  end
end

Given(/^I am on a flight page$/) do
  visit_page(SouthwestHome)
  on_page(SouthwestSearch) do |page|
    page.search_flights(DEPARTURE_CITY, ARRIVAL_CITY)
  end
end

When(/^I try to click a departure or return date in the past$/) do
  on_page(SouthwestCalendar) do |page|
    page.set_dates
    page.click_past_dates
  end
end

Then(/^I am unable to update the departure or return date$/) do
  on_page(SouthwestCalendar) do |page|
    expect(page.dates_unchanged?).to be true
  end
end