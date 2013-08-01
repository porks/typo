Feature: Merge Articles
  As a blog administrator
  In order to eliminate redudancy between articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
#    And the following articles exists:
#    | title          | body              |
#    | post 1 title 1 | body 1 post num 1 |
#    | post 2 title 2 | body 2 post num 2 |
    And I am on the new article page
    And I fill in "article_title" with "post 1 title 1"
    And I fill in "article__body_and_extended_editor" with "body 1 post num 1"
    And I press "Publish"
    And I am on the new article page
    And I fill in "article_title" with "post 2 title 2"
    And I fill in "article__body_and_extended_editor" with "body 2 post num 2"
    And I press "Publish"



  Scenario: Successfully merge articles
    Given I am on the edit article page for "post 1 title 1"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with the id of the article "post 2 title 2"
    And I press "Merge"
    Then I should see "post 1 title 1"
    And I should see "body 1 post num 1"
    And I should see "body 2 post num 2"
