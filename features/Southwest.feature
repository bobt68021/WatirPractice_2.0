Feature: Southwest Flights

  Scenario: Highlighted days are correct
    Given I am on the booking page
    When I submit data with default dates
    Then the default dates should be highlighteds