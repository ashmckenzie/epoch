RAILS_GEM_VERSION = '2.3.10' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "formtastic"
  config.gem "chronic"
  config.time_zone = 'UTC'
end

ExceptionNotification::Notifier.exception_recipients = %w(ash@greenworm.com.au)
ExceptionNotification::Notifier.sender_address = %("Application Error" <noreply@the-rebellion.net>)
ExceptionNotification::Notifier.email_prefix = "[Epoch] " 

ActionMailer::Base.delivery_method = :sendmail
