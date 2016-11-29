require 'watir-webdriver'
require 'page-object'

class ManifestHome
  include PageObject

  page_url 'http://manifestcorp.com/'

  link(:opportunities_link,  :text => 'Opportunities')
  link(:all_opportunities_link,  :text => 'See all job opportunities')
  div(:application_link, :class => 'opp-action')

  def go_to_opportunities
    opportunities_link_element.when_present.click
    all_opportunities_link_element.when_present.click
  end

  def go_to_application
    go_to_opportunities
    application_link_element.link_element.when_present.click
  end
end