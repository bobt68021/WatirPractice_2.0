require 'watir-webdriver'
require 'page-object'

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
    (fix_date(@@depart) === @browser.li(:id => 'carouselTodayDepart').attribute_value('carouselfulldate')) && (fix_date(@@return) === @browser.li(:id => 'carouselTodayReturn').attribute_value('carouselfulldate'))
  end

  def fix_date(date)
    date_array = date.split(' ')
    date_array[3] + "/" + get_month(date_array[1]) + "/" + fix_day(date_array[2])
  end

  def fix_day(day)
    day.length==1 ? day = "0" + day : day
  end

  def get_month (month)
    month_values = Hash.new

    month_values['Jan']="01"
    month_values['Feb']="02"
    month_values['Mar']="03"
    month_values['Apr']="04"
    month_values['May']="05"
    month_values['Jun']="06"
    month_values['Jul']="07"
    month_values['Aug']="08"
    month_values['Sep']="09"
    month_values['Oct']="10"
    month_values['Nov']="11"
    month_values['Dec']="12"

    month_values[month]
  end
end