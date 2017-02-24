ActionMailer::Base.smtp_settings = {
  :user_name => 'Maxie',
  :password => 'sendgrid1',
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
