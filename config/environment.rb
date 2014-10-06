# -*- encoding : utf-8 -*-
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Azcommunity::Application.initialize!

Azcommunity::Application.configure do
	config.action_mailer.delivery_method = :smtp

	config.action_mailer.smtp_settings = {
		address:        "smtp.gmail.com", 
		port:           587,
		domain:         "allianz.community.com",
		authentication: "plain",
		user_name:      "allianz.community@gmail.com",
		password:       "30dq47vY",
		enable_starttls_auto: true
	}

	#config.action_mailer.raise_delivery_errors = true
	#config.time_zone = 'Moscow' # +0400
	#config.time_zone = "(GMT+04:00) Moscow"
	config.time_zone = 'Moscow'
	config.active_record.default_timezone = :local

end

Time::DATE_FORMATS[:ru_datetime] = "%Y.%m.%d в %k:%M:%S"