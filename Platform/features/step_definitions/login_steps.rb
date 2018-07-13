
Given(/^User access Platform/) do
  @app.login.access_Platform
end

When(/^Creates first node$/) do
  @app.login.create_first_node
end

When(/^Creates subsequent node$/) do
  @app.login.create_subsequent_node
end

When(/^Unsubscribing from a node subscription$/) do
  @app.login.unsubscribe_node
end

And(/^Fills Node Configuration for Shared Rinkeby Node and Submits$/) do
  @app.login.subscribe_to_shared_rinkeby_node
end

And(/^Fills Node Configuration for Dedicated Mainnet Node and Submits$/) do
  @app.login.create_dedicated_mainnet_node
end

And(/^Adds credit card information$/) do
  @app.login.fill_stripe_elements
end

Then(/^See subscribed node on the dashboard$/) do
  @app.login.see_shared_node
end

Then(/^See created dedicated node on the dashboard$/) do
  @app.login.see_dedicated_node
end

Then(/^Should not see the subscribed node on the dashboard$/) do
  @app.login.see_no_shared_node
end
