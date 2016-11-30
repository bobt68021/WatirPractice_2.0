require 'watir-webdriver'
require 'page-object'

class ManifestSearch
  include PageObject

  select_list(:city_select, :name => 'opportunity_loc')
  divs(:city_results, :class => 'opp-loc')

  select_list(:type_select, :name => 'opportunity_type')
  divs(:type_results, :class => 'opp-type')

  def filter_city city
    city_select_element.select city
  end

  def get_city_results
    city_results_elements
  end

  def filter_type type
    type_select_element.select type
  end

  def get_type_results
    type_results_elements
  end
end