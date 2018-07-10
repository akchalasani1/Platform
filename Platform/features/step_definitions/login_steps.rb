
Given(/^User access Platform/) do
  @app.login.access_Platform
end

And(/^i add a credit card$/) do
  @app.login.fill_stripe_elements
end

And(/^User enters email$/) do
  @app.login.access_Platform
end

And(/^User enters password$/) do
  @app.login.access_Platform
end

Then(/^User clicks on the login$/) do
  @app.login.access_Platform
end

And(/^User selects "([^"]*)"$/) do |network_name|
  @app.login.select_network(network_name, $org_wallet_phase, $org_wallet_password, $org_wallet_cnfm_password, $org_wallet_key)
end


And(/^User selects "([^"]*)" as participant$/) do |network_name|
  @app.login.ptcpnt_select_network(network_name, $prpnt_wallet_phase, $prpnt_wallet_password, $prpnt_wallet_cnfm_password, $prpnt_wallet_key)

end



