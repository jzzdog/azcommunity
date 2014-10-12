# -*- encoding : utf-8 -*-
class ForumController < ApplicationController
  def index  	  	
    @info = 'Здесь отображается список рубрик форума.
      Выберите интересную рубрику, чтобы посмотреть публикации по этой теме. 
      Напишите на allianz.community@gmail.com, если интересная Вам рубрика отсутствует.'
    @no_info_links = true
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
