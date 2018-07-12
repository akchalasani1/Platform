
Given(/^User access Platform/) do
  @app.login.access_Platform
end

And(/^Creates first node$/) do
  @app.login.create_first_node
end

And(/^Fills Node Configuration for Shared Rinkeby Node and Submits$/) do
  @app.login.subscribe_to_shared_rinkeby_node
end

And(/^Adds credit card information$/) do
  @app.login.fill_stripe_elements
end
