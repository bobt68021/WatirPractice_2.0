require 'watir-webdriver'
require 'page-object'

class SouthwestHome
  include PageObject
  page_url 'https://www.southwest.com/'
end