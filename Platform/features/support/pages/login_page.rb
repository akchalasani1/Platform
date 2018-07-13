
class LoginPage < BasePage
     element   :yur_login_emil,               :xpath, "//input[@type='email']"
     element   :yur_login_pswd,               :xpath, "//input[@type='password']"
     element   :yur_login_lnk,                :xpath, "//span[@class='auth0-label-submit']"
     element   :yur_signupnode_lnk,           :xpath, "//div[text()='Spin up a node']"

     element   :btn_next,                     :xpath, "//div[@class ='PanelButton Primary']"

     element   :btn_sbmt,                     :xpath, "//button[@type='submit']"
     element   :iframe_id,                    :xpath, "//iframe[@name ='stripe_checkout_app']"
     element   :btn_new_node,                 :xpath, "//a[@href='/newnode']"
     element   :dedicated_node_radio,         :xpath, "//div[text()='Your own dedicated node - ']"
     element   :mainnet_node_radio,           :xpath, "//div[text()='MAINNET']"
     element   :dedicated_node_on_dashboard,  :xpath, "//td[text()='Dedicated']"
     element   :shared_node_on_dashboard,     :xpath, "//td[text()='Shared']"

     def access_Platform
        app_invoke
        window = page.driver.browser.window_handles
        self.yur_login_emil.set "minh@wetrust.io"
        self.yur_login_pswd.set "Ac041880!"
        self.yur_login_lnk.click
        sleep 2
     end

     def create_first_node
        sleep 2
        self.yur_signupnode_lnk.click
        sleep 2
     end

     def create_subsequent_node
      self.btn_new_node.click
      sleep 2
     end

     def create_dedicated_mainnet_node
        self.dedicated_node_radio.click
        sleep 2
        self.btn_next.click
        self.mainnet_node_radio.click
        sleep 2
        self.btn_next.click
     end

     def subscribe_to_shared_rinkeby_node
        self.btn_next.click
        sleep 2
        self.btn_next.click
        sleep 10
     end


     def fill_stripe_elements(card: '4242424242424242', expiry: '01/22', cvc: '123')
       using_wait_time(10) {
        #  frame = find('stripe_checkout_app')
         within_frame('stripe_checkout_app') do
          #  find_field('exp-date').send_keys expiry
          find_field('Name').send_keys "Some Full Name"
          find_field('Street').send_keys "Some Street Address"
          find_field('Postcode').send_keys "777222"
          find_field('City').send_keys "Mountain View"
          sleep 2
          click_button 'Payment Info'

          fill_in 'Card number', with: '4242424242424242' #test card number
          fill_in 'MM / YY', with: '02/22'
          fill_in 'CVC', with: '222'
          click_button 'Add Card'
          sleep 10
         end 
       }
     end
    
    def see_dedicated_node
      self.dedicated_node_on_dashboard
      sleep 10
    end

    def see_shared_node
      self.shared_node_on_dashboard
      sleep 10
    end
 end
