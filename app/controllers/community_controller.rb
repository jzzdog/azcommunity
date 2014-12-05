# -*- encoding : utf-8 -*-
class CommunityController < ApplicationController
  def news
  	@info = "#{User.find(session[:user_id]).name.capitalize}, добро пожаловать в сообщество сотрудников Allianz!
  		На странице приветствия приведен список последних новостей сообщества. Используйте панель навигации в
  		верхней части страницы для доступа к нужным разделам."
  	@no_info_links = true
  	@last_users = User.all.order(created_at: :desc).limit(3)
  	@last_adverts = Advert.where(status: 1).order(created_at: :desc).limit(2)
  	@last_posts = Post.all.order(created_at: :desc).limit(2)  	
  end
end
