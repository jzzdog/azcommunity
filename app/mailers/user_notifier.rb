# -*- encoding : utf-8 -*-
class UserNotifier < ActionMailer::Base
  default from: "allianz.community@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.confirmation.subject
  #
  def confirmation(user)
    
    @user = user

    @confirm_path = "http://localhost:3000/" + users_confirm_path + "?id="+@user.id.to_s+"&hash=" + @user.confirm_hash

    mail to: @user.mail, subject: 'Email confiramtion'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.greeting.subject
  #
  def greeting
    @greeting = "Hi"

    mail to: "dmanishchenko@gmail.com", subject: 'Greeting'
  end
end
