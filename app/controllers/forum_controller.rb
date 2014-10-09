# -*- encoding : utf-8 -*-
class ForumController < ApplicationController
  def index  	  	
  	@topics = Topic.all
  end  

  def notify  	  	

  	@post_id = params[:post_id]
  	if (params[:user] == "all")
  	  @users = User.all  	  
  		@users.each { |user|
  		  UserNotifier.new_post_notification(user, params[:post_id]).deliver}
  		
  	else
  	  @user = User.find_by(name: 'admin') 
  	  UserNotifier.new_post_notification(@user, @post_id).deliver
  	end
  	@message_text = @user.mail#'Рассылка успешно отправлена'

  end  
end
