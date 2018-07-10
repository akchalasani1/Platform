
class LoginPage < BasePage


     element   :choose_network,              :xpath, ".//div[@class='network-name']"

     # elements because it is clickable on multiple same name items.
     elements  :network_name,                :xpath, "//li[@class='dropdown-menu-item']"
     element   :btn_accept,                  :xpath, "//button[text() = 'Accept']"

     element   :wallet_seed,                 :xpath, "//textarea[@placeholder='Enter your secret twelve word phrase here to restore your vault.']"
     element   :termsOfUse,                  :xpath, "//div[@class='notice-box']//a[text()='Terms of Use']"
     element   :link_import_existing_DEN,    :xpath, "//p[text()='Import Existing DEN']"
     element   :new_password,                :xpath, "//input[@id='password-box']"
     element   :confirm_password,            :xpath, "//input[@id='password-box-confirm']"
     element   :btn_ok,                      :xpath, "//button[text() = 'OK']"

     element   :click_user_icon,             :xpath, "//div[@class='cursor-pointer color-orange accounts-selector']"
     element   :import_user,                 :xpath, "//span[text()='Import Account']"
     element   :prvt_key,                    :xpath, "//input[@id='private-key-box']"
     element   :btn_import,                  :xpath, "//button[text()='Import']"
     element   :btn_metamask,                :xpath, "//button[text()='METAMASK LOG IN']"
     element   :sign_message_button,         :xpath, "//button[text()='Sign']"

     element   :ptcpnt_login,                :xpath, "//p[text()='Restore from seed phrase']"

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
     element   :btn_new_node,                 :xpath, "//span[text()='+ New node']"

     def access_Platform
        #visit(BASE_URL)
        app_invoke
        window = page.driver.browser.window_handles
        #puts"window.size: #{window.size}"
        # if window.size > 1
        #   page.driver.browser.switch_to.window(window.last)
        #   page.driver.visit 'chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn/popup.html'
        # end
        self.yur_login_emil.set "anil@wetrust.io"
        self.yur_login_pswd.set "Ac041880!"
        self.yur_login_lnk.click
        sleep 2
        self.btn_new_node.click
        sleep 2
       #self.yur_signupnode_lnk.click
        self.btn_next.click
        sleep 2
        self.btn_next.click


        # page.within_frame('iframe_id') do
        #   fill_in 'yur_cardnumber', with: '4242424242424242'
        #   fill_in 'yur_exp', with: '03/20'
        #   fill_in 'yur_cvc', with: '123'
        #   click_button 'btn_sbmt'
        # end
     end


     def fill_stripe_elements(card: '4242424242424242' , expiry: '01/22', cvc: '123')
       using_wait_time(10) {
         frame = find('iframe_id')
         within_frame(frame) do
           card.to_s.chars.each do |piece|
             find_field('cardnumber').send_keys(piece)
           end

           find_field('exp-date').send_keys expiry
           find_field('cvc').send_keys cvc
         end }
     end


     def select_network(networkName, walseed, pswd, confpwd, keyprvt)

       choose_network.click
       has_network_name?
       sleep 1
       network_name.each do |network|
         if network.text == networkName
           ILogger.info("network:#{network.text}")
           network.click
           break
         end
       end

       click_button 'Accept' # click_button has in built sleep
       #btn_accept.click
       has_termsOfUse?  # waiting to get displayed
       termsOfUse.click

       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.close
       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.last)
       btn_accept.click
       link_import_existing_DEN.click

       self.wallet_seed.set walseed
       self.new_password.set pswd
       self.confirm_password.set confpwd
       has_btn_ok?
       btn_ok.click
       has_click_user_icon?
       sleep 1
       click_user_icon.click
       sleep 1
       has_import_user?
       import_user.click
       self.prvt_key.set keyprvt
       btn_import.click
       sleep 3
       page.driver.browser.switch_to.window(window.first)
       has_btn_metamask?
       btn_metamask.click
       sleep 3
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.navigate.refresh
       sleep 3
       has_sign_message_button?
       sign_message_button.click
       page.driver.browser.switch_to.window(window.first)
     end

     def user_select_network(networkName, walseed, pswd, confpwd, keyprvt)
       has_ptcpnt_login?
       ptcpnt_login.click
       self.wallet_seed.set walseed
       self.new_password.set pswd
       self.confirm_password.set confpwd
       has_btn_ok?
       btn_ok.click
       has_click_user_icon?
       sleep 1
       click_user_icon.click
       sleep 1
       has_import_user?
       import_user.click
       self.prvt_key.set keyprvt
       btn_import.click
       sleep 3
       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.first)
       sleep 5
       has_btn_metamask?
       btn_metamask.click
       sleep 5
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.navigate.refresh
       sleep 5
       has_sign_message_button?
       sign_message_button.click
       page.driver.browser.switch_to.window(window.first)
       sleep 3
     end
 end
