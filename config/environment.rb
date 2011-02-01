RAILS_GEM_VERSION = '2.3.10' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "formtastic"
  config.gem "chronic"
  config.gem "webrat"
  config.gem "exception_notification"
  config.time_zone = 'UTC'
end

ExceptionNotification::Notifier.exception_recipients = %w(ash@greenworm.com.au)
