Feature: Platform - Login

	@login
	Scenario: User creates first node which is rinkeby node
		Given User access Platform
		And Creates first node
		And Fills Node Configuration for Shared Rinkeby Node and Submits
		And Adds credit card information
#		Then User clicks on the login


#And User selects "Rinkeby Test Network"
#And User selects "Rinkeby Test Network" as participant
