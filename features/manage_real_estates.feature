@real_estates
Feature: Real Estates
  In order to have real_estates on my website
  As an administrator
  I want to manage real_estates

  Background:
    Given I am a logged in refinery user
    And I have no real_estates

  @real_estates-list @list
  Scenario: Real Estates List
   Given I have real_estates titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of real_estates
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @real_estates-valid @valid
  Scenario: Create Valid Real Estate
    When I go to the list of real_estates
    And I follow "Add New Real Estate"
    And I fill in "House" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 real_estate

  @real_estates-invalid @invalid
  Scenario: Create Invalid Real Estate (without house)
    When I go to the list of real_estates
    And I follow "Add New Real Estate"
    And I press "Save"
    Then I should see "House can't be blank"
    And I should have 0 real_estates

  @real_estates-edit @edit
  Scenario: Edit Existing Real Estate
    Given I have real_estates titled "A house"
    When I go to the list of real_estates
    And I follow "Edit this real_estate" within ".actions"
    Then I fill in "House" with "A different house"
    And I press "Save"
    Then I should see "'A different house' was successfully updated."
    And I should be on the list of real_estates
    And I should not see "A house"

  @real_estates-duplicate @duplicate
  Scenario: Create Duplicate Real Estate
    Given I only have real_estates titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of real_estates
    And I follow "Add New Real Estate"
    And I fill in "House" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 real_estates

  @real_estates-delete @delete
  Scenario: Delete Real Estate
    Given I only have real_estates titled UniqueTitleOne
    When I go to the list of real_estates
    And I follow "Remove this real estate forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 real_estates
 