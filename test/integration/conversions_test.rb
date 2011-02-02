require 'integration_test_helper'

class ConversionsTest < ActionController::IntegrationTest

  test "just landed and clicked convert" do
		visit '/'
		click_button 'CONVERT'
		assert page.has_no_content? 'Date/time format field should not be blank'
		assert page.has_content? 'Timezone cannot be blank'
		assert page.has_content? 'Date/time cannot be blank'
  end

  test "emptied all fields and clicked convert" do
		visit '/'
		fill_in 'convert_datetime_format', :with => ""
		click_button 'CONVERT'
		assert page.has_content? 'Date/time format field should not be blank'
		assert page.has_content? 'Timezone cannot be blank'
		assert page.has_content? 'Date/time cannot be blank'
  end

  test "now as epoch and clicked convert" do
		visit '/'
		select "Australia/Melbourne:Melbourne", :from => 'convert_timezone'
		fill_in 'convert_datetime_format', :with => "%s"
		fill_in 'convert_datetime_input', :with => "now"
		click_button 'CONVERT'
		assert page.has_no_content? 'Date/time format field should not be blank'
		assert page.has_no_content? 'Timezone cannot be blank'
		assert page.has_no_content? 'Date/time cannot be blank'
  end

end
