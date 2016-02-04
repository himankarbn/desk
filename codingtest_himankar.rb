#!/usr/bin/ruby
################################################
# Author: Himankar
# Steps:
# 1. Create site at http://reg.deskstaging.com/free-trial.  A site name can only be used once so you will need to randomize your site name somehow.I recommend a timestamp.
# 2. Dismiss the Welcome dialog by sending the escape key
# 3. Click on the phone case to view it (This case has a green phone icon)
# 4. Click the "Add a new inbound phone call" button and enter a paragraph of random text in the text area.  (HINT:  Don’t get caught up on this step, worrying how to generate random text.  You can use the Faker gem to generate random text, use a timestamp, etc.) 
# 5. Click the “Update & Resolve” button to save the text and close the tab
# 6. Click on the “All Cases” folder
# 7. Re-open the case and verify the random paragraph text from step 4 appears in the expected element
###################################################

require 'rubygems'
require 'watir-webdriver'
require 'time'
#require 'minitest/autorun'

#Setup
#class HomePage < MiniTest::Unit::TestCase
  # def test_new
	profile = Selenium::WebDriver::Firefox::Profile.new
	profile.assume_untrusted_certificate_issuer = false
	browser = Watir::Browser.new:firefox, :profile => profile
	browser.driver.manage.timeouts.implicit_wait = 5
	browser.add_checker do |page|
	  page.text.include?("Server not found") and puts "Application exception or 500 error!"
	end
	browser.goto "www.meee123.com/page-with-error"
	"Server error! (RuntimeError)"

	$sitename = "Automation"+Time.now.utc.iso8601
	$RandomText = "RamdomText"+Time.now.utc.iso8601
=begin  
	

#Launching the Site And loggin

	browser.goto("https://reg.deskstaging.com/free-trial")
	
#	assert(browser.text.include?("Start your FREE trial"))
	#Enter Username
	browser.text_field(:id => "user_name").when_present.set "blah"
	
	#Enter Email
	browser.text_field(:id => "user_email").set "xxxx@gmail.com"
	
	#Enter Phone
	browser.text_field(:id => "user_site_attributes_contact_phone").set "1000000000"
	
	#Enter Unique SiteName
	browser.text_field(:id => "user_site_attributes_subdomain").set $sitename
	
	#Select Size
	browser.select_list(:id, "user_site_attributes_signup_size").select_value("1")
	
	#Click on Submit and Wait for the page to display "Let's get Started"
	browser.button(:value => "Start Your Free Trial").click
	Watir::Wait.until { browser.text.include? "Let's get started!" }
#   end
#end

#Getting Started
	
	#browser.send_keys :escape
	#Click on "Take me to Desk"
	browser.element(:css => "#agent-tour-welcome_new .ds-take-me-to-desk a").click
	
	#Click "No Thanks"
	browser.element(:css => "#agent-tour-viewTour .ds-popover-content .ds-popover-button ").click

	#Click The Green Phone Icon
	browser.element(:xpath => "//*[contains(text(),'The Top 3 Features Our Customers Love!')]//ancestor::tr/td[2]/img").when_present.click

	#Click "Add new inbound phone call"
	browser.element(:xpath => "//*[contains(text(),'New Inbound Phone Call')]/ancestor::button").when_present.click
	
	#Enter some random text
	browser.textarea(:css => ".phone_reply_div_reply_area .theTextArea").when_present.set $RandomText

	#Click on Update and Resolve Button
	browser.element(:css => "#case_footer .ticket_action_buttons_buttons .send_button .update_send_resolve").when_present.click

	#Click on All Cases
	browser.link(:xpath => "//a[contains(text(),'All Cases')]").when_present.click
	
	#Click the latest message and wait for the page to load 
	browser.element(:xpath => "//*[contains(text(),'The Top 3 Features Our Customers Love!')]//ancestor::tr/td[2]/img").when_present.click
	browser.element(:css => ".customer_history_ticket.not-first .customer_history_ticket_phone_message").wait_until_present

#Assertion	
	#Verify the result"
 	if browser.text.include? $RandomText
	   	puts "Test Passed. Found the expected string"
	else    
 	   	puts " Test Failed! Could not find expected string"
	end 

#TearUp
	#Close the browser
	browser.close
=end
