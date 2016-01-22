Feature: Test Meme Generator

  Scenario: User creates a meme on imgflip website
    Given I navigate to the ImageFlip Home page
    And I click the make a meme link
    And I generate the 'Leonardo Dicaprio Cheers' meme:
      | top_text                                       | bottom_text                    |
      | That fake smile you put on when you realise... | you still haven't won an oscar |
    And I see the meme lightbox
    When I click the go to image page button
    Then I should see the expected meme descriptions