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

  def invitation(email, user)

    @email = email
    @user = user

    if Rails.env.production?
      @root_path = "http://allianz-community.com/"
    else
      @root_path = "http://localhost:3000/"
    end

    @reg_path = @root_path + "users/new"    

    mail to: @email, subject: 'Invitation to Allianz Community'
  end

  def new_post_notification(recipient, post_id)
    @recipient = recipient
    @email = @recipient.mail
    if @email == 'admin@allianz.ru'
      @email = 'dmanishchenko@gmail.com'
    end
    @post = Post.find(post_id)
    @creator = User.find(@post.user_id)
    @topic = Topic.find(@post.topic_id)
    @link = Rails.env.production? ? 'http://allianz-community.com/' : 'http://localhost:3000/'
    @link = @link + 'posts/' + post_id.to_s

    if @email
      mail to: @email, subject: 'Новая публикация в Allianz Community'      
    end
    
  end
end
