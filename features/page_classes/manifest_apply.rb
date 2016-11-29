require 'watir-webdriver'
require 'page-object'

class ManifestApply
  include PageObject

  text_field(:first_name, :id => 'input_3_1_3')
  text_field(:last_name, :id => 'input_3_1_6')
  text_field(:phone_number, :id => 'input_3_2')
  text_field(:email_adress, :id => 'input_3_3')
  text_field(:url_links, :name => 'input_5[]')
  img(:add_button, :class => 'add_list_item ')
  text_area(:comment, :id => 'input_3_8')
  button(:submit, :id => 'gform_submit_button_3')
  div(:validation_message, :class => 'gfield_description validation_message')


  def fill_form
    first_name_element.set('first name test')
    last_name_element.set('first name test')
    phone_number_element.set('6145550011')
    email_adress_element.set('test@email.test')
    url_links_element.set('www.test.com')
    add_button_element.click
    comment_element.set('I am a test comment')
    sleep 2
    #submit_element.click // this attempt to submit the form but bring up validations error (on purpose)
  end

  def validate
    sleep 2
    validation_message_element.exists?
  end
end