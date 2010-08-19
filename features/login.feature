Feature: Login user
  In order to track persons spendings and to simplify identification and user control
  users need to be able to log on with their Facebook profile.

  Scenario: Login with Facebook
    Given user "Bekk Open" accesses the application
    When the user signs in with Facebook
    Then the user should see the name "Bekk Open"