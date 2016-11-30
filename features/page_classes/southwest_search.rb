require 'watir-webdriver'
require 'page-object'
require 'date'
class SouthwestSearch
  include PageObject

  text_field(:depart_city, :id => 'air-city-departure')
  text_field(:arrive_city, :id => 'air-city-arrival')
  text_field(:depart_date, :id => 'air-date-departure')
  text_field(:return_date, :id => 'air-date-return')
  button(:submit, :id => 'jb-booking-form-submit-button')

  def set_dates(depart_date, arrival_date)
    self.depart_date = depart_date
    self.return_date = arrival_date
    @@depart = @browser.div(:class => 'js-depart-date-label booking-form--label booking-form--date-container-label').text
    @@return = @browser.div(:class => 'js-return-date-label booking-form--label booking-form--date-container-label').text
  end

  def search_flights(departure, arrival)
    self.depart_city = departure
    self.arrive_city = arrival
    submit_element.click
  end

  def compare_dates
    (Date.parse(@@depart) == Date.parse(@browser.li(:id => 'carouselTodayDepart').attribute_value('carouselfulldate')))&&
        Date.parse(@@return) == Date.parse(@browser.li(:id => 'carouselTodayReturn').attribute_value('carouselfulldate'))
  end
end