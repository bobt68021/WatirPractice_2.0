require 'watir-webdriver'
require 'page-object'
require 'date'

class SouthwestCalendar
  include PageObject

  li(:current_departure, :id => 'carouselTodayDepart')
  li(:current_arrive, :id => 'carouselTodayReturn')
  div(:depart_calendar, :id => 'newDepartDateCarousel')
  div(:return_calendar, :id => 'newReturnDateCarousel')

  def set_dates
    @@initial_depart_date = current_departure_element.attribute('carouselfulldate')
    @@initial_return_date = current_arrive_element.attribute('carouselfulldate')
  end

  def click_past_dates
    depart_calendar_element.list_item_elements.each do |date|
      click_past_date(date)
    end
    return_calendar_element.list_item_elements.each do |date|
      click_past_date(date)
    end
  end

  def click_past_date(date)
    today = Date.today
    if Date.parse(date.attribute('carouselfulldate')) < today
      date.click
      puts date.text
    end
  end

  def dates_unchanged?
    (@@initial_depart_date == current_departure_element.attribute('carouselfulldate')) &&
    (@@initial_return_date == current_arrive_element.attribute('carouselfulldate'))
  end

end