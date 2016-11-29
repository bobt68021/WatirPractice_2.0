Feature: Viewing opportunities
  Scenario: I want to view opportunities in Columbus
    Given I am on the opportunities page
    When I filter city to Columbus
    Then I am only shown opportunities in Columbus

  Scenario: I was to view Contract To Hire opportunities
    Given I am on the opportunities page
    When I filter type to Contract To Hire
    Then I am only shown Contract To Hire opportunities

  Scenario: I want to fill out an application form
    Given I am on an opportunity application page
    When I fill out everything but don't upload a resume and submit
    Then I get a warning to upload a resume