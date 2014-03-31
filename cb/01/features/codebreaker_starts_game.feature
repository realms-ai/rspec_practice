#START:title_and_narrative
Feature: code-breaker starts game

  As a code-breaker
  I want to start a game
  So that I can break the code
#END:title_and_narrative

#START:scenario_only
  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Codebreaker!"
    And I should see "Enter guess:"
#END:scenario_only

Feature: code-breaker submits guess

	As a code-breaker
	I want to submit a guess
	So that I can try to break the code
	
	Scenario Outline: submit guess
		Given the secret code is "<code>"
		When I guess "<guess>"
		Then the mark should be "<mark>"
		
	Scenarios: all numbers correct
		| code | guess | mark |
		| 1234 | 1234  | ++++ |
		| 1234 | 1243  | ++-- |
		| 1234 | 1423  | +--- |
		| 1234 | 4321  | ---- |
		
	Scenarios: no matches
		| code | guess | mark |
		| 1234 | 5555  |      |
		
		
	Scenarios: 1 number correct
		| code | guess | mark |
		| 1234 | 1555  | +    |
		| 1234 | 5545  | -    |
		
	Scenarios: 2 numbers correct
		| code | guess | mark |
		| 1234 | 5254  | ++   |
		| 1234 | 5154  | +-   |
		| 1234 | 2545  | --   |
		
	Scenarios: 3 numbers correct
		| code | guess | mark |
		| 1234 | 5234  | +++  |
		| 1234 | 5143  | ++-  |
		| 1234 | 5124  | +--  |
		| 1234 | 5123  | ---  |
		
	
	Scenario: all exact matches
		Given the secret code is "1234"
		When I guess "1234"
		Then the mark should be "++++"
		
	Scenario: 2 exact matches and 2 number matches
		Given the secret code is "1234"
		When I guess "1234"
		Then the mark should be "++--"
		
	Scenario: 1 exact match and 3 number matches
		Given the secret code is "1234"
		When I guess "1342"
		Then the mark should be "+---"
		
	Scenario: 4 number matches
		Given the secret code is "1234"
		When I guess "4321"
		Then the mark should be "----"
	
    
