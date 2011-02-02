require 'integration_test_helper'

class ConversionsTest < ActionController::IntegrationTest

  test "all fields empty" do
		visit '/'
		select "", :from => 'convert_timezone'
		fill_in 'convert_datetime_format', :with => ""
		fill_in 'convert_datetime', :with => ""
		click_button 'CONVERT'
		assert page.has_content? 'Date/time format field should not be blank'
		assert page.has_content? 'Timezone cannot be blank'
		assert page.has_content? 'Date/time cannot be blank'
  end
  
  test "invalid date/time" do
		visit '/'
		select "", :from => 'convert_timezone'
		select "Melbourne", :from => 'convert_timezone'
		fill_in 'convert_datetime', :with => "bad bad bad"
		click_button 'CONVERT'
		assert page.has_content? 'Chronic did not understand you, sorry.'
  end

  test "now as epoch with default format and clicked convert" do
		visit '/'
		select "Melbourne", :from => 'convert_timezone'
		fill_in 'convert_datetime', :with => "now"
		click_button 'CONVERT'
		assert page.has_content? Time.now.strftime(Convert::DEFAULT_DATETIME_FORMAT).to_s
  end
  
  test "now as epoch with custom format and clicked convert" do
    format = "%d/%m/%Y"		
    visit '/'
		select "Melbourne", :from => 'convert_timezone'
    fill_in 'convert_datetime_format', :with => format
		fill_in 'convert_datetime', :with => "now"
		click_button 'CONVERT'
		assert page.has_content? Time.now.strftime(format).to_s
  end		
  
  test "1 jan 2010 as epoch and clicked convert" do
		visit '/'
		select "Melbourne", :from => 'convert_timezone'
		fill_in 'convert_datetime_format', :with => "%s"
		fill_in 'convert_datetime', :with => "1 jan 2010"
		click_button 'CONVERT'
		assert page.has_content? '1262307600'
  end
  
  test "1262307600 with default format and clicked convert" do
		visit '/'
		select "Melbourne", :from => 'convert_timezone'
		fill_in 'convert_datetime', :with => "1262307600"
		click_button 'CONVERT'
		assert page.has_content? '01/01/2010 12:00:00 PM'
  end

end
