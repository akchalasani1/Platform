Feature: Platform - Login

	@login
	Scenario: User creates first node which by subscribing to rinkeby node
		Given User access Platform
		When Creates first node
		And Fills Node Configuration for Shared Rinkeby Node and Submits
		And Adds credit card information
		Then See subscribed node on the dashboard
