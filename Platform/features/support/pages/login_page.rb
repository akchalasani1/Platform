
class LoginPage < BasePage
     element   :yur_login_emil,               :xpath, "//input[@type='email']"
     element   :yur_login_pswd,               :xpath, "//input[@type='password']"
     element   :yur_login_lnk,                :xpath, "//span[@class='auth0-label-submit']"
     element   :yur_signupnode_lnk,           :xpath, "//div[text()='Spin up a node']"

       element   :btn_next,           :xpath, "//div[@class ='PanelButton Primary']"

     #element   :btn_next,           :xpath, "//div[@class ='PanelButton Primary']"

     element   :btn_addcard,                  :xpath, "//div[text()='Add Card and Create']"
     element   :lnk_fil_crd_dtls_manually,    :xpath, "//span[text()='Fill in your card details manually.']"
     element   :yur_cardnumber,               :xpath, "//input[@id='bedee8c0-7eff-11e8-814c-858bf32db70c']"
     element   :yur_exp,                      :xpath, "//input[@id='bedf0fd0-7eff-11e8-814c-858bf32db70c']"
     element   :yur_cvc,                      :xpath, "//input[@id='bedf36e0-7eff-11e8-814c-858bf32db70c']"
     element   :btn_sbmt,                     :xpath, "//button[@type='submit']"
     element   :iframe_id,                    :xpath, "//iframe[@name ='stripe_checkout_app']"
     element   :btn_new_node,                 :xpath, "//a[@href='/newnode']"

     def access_Platform
        app_invoke
        window = page.driver.browser.window_handles
        self.yur_login_emil.set "anil@wetrust.io"
        self.yur_login_pswd.set "Ac041880!"
        self.yur_login_lnk.click
        sleep 2
     end

     def create_first_node
        self.yur_signupnode_lnk.click
        sleep 2
     end

     def create_subsequent_node
      self.btn_new_node.click
      sleep 2
     end

     def subscribe_to_shared_rinkeby_node
        self.btn_next.click
        sleep 2
        self.btn_next.click
        sleep 2
     end


     def fill_stripe_elements(card: '4242424242424242' , expiry: '01/22', cvc: '123')
       using_wait_time(10) {
         frame = find('.stripe_checkout_app')
         within_frame(frame) do
          # TODO: Fill up billing address and card info
          #  card.to_s.chars.each do |piece|
          #    find_field('cardnumber').send_keys(piece)
          #  end

          #  find_field('exp-date').send_keys expiry
          #  find_field('cvc').send_keys cvc
         end }
     end
 end
