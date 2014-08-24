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

    if Rails.env.production?
      @root_path = "http://allianz-community.com/"
    else
      @root_path = "http://localhost:3000/"
    end

    @confirm_path = @root_path + users_confirm_path + "?id="+@user.id.to_s+"&hash=" + @user.confirm_hash
    mail to: @user.mail, subject: 'Email confiramtion'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.greeting.subject
  #
  def greeting
    @greeting = "Hi"

    mail to: "dmanishchenko@gmail.com", subject: 'Invitation to Allianz Community'
  end

  def invitation(user)

    @user = user

    if Rails.env.production?
      @root_path = "http://allianz-community.com/"
    else
      @root_path = "http://localhost:3000/"
    end

    @reg_path = @root_path + "users/new"    

    mail to: @user.mail, subject: 'Invitation to Allianz Community'
  end
end
