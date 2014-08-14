class UserNotifier < ActionMailer::Base
  default from: "allianz.community@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.confirmation.subject
  #
  def confirmation
    
    @greeting = "hi"

    mail to: "dmanishchenko@gmail.com", subject: 'confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.greeting.subject
  #
  def greeting
    @greeting = "Hi"

    mail to: "dmanishchenko@gmail.com", subject: 'greeting'
  end
end
