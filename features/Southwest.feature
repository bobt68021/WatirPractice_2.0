Feature: Southwest Flights

  Scenario: Highlighted days are correct
    Given I am on the booking page
    When I submit flight information
    Then the default dates should be highlighted

  Scenario: Past departure days are unclickable
    Given I am on a flight page
    When I try to click a departure or return date in the past
    Then I am unable to update the departure or return date