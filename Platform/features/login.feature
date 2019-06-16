Feature: Platform - Login

	@login
	Scenario: User creates first node which by subscribing to rinkeby node
		Given User access Platform
		When Creates first node
		And Fills Node Configuration for Shared Rinkeby Node and Submits
		And Adds credit card information
		Then See subscribed node on the dashboard

	@login
	Scenario: User creates second node which is a dedicated mainnet node
		Given User access Platform
		When Creates subsequent node
		And Fills Node Configuration for Dedicated Mainnet Node and Submits
		Then See created dedicated node on the dashboard

	@login
	Scenario: User unsubscribes from a node
		Given User access Platform
		When Unsubscribing from a node subscription
		Then Should not see the subscribed node on the dashboard
