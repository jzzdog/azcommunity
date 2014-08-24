# -*- encoding : utf-8 -*-
class AdvListController < ApplicationController
  def index

    if params[:limit]     
      @limit = params[:limit].to_i
    else
      @limit = 5    
    end

  	if (params[:only_my] == "1")
  		@header_text = "Мои объявления"
  		@adv = Advert.where(user_id: session[:user_id]).order(created_at: :desc).limit(@limit)
  	else
  		@header_text = "Объявления"
  		@adv = Advert.where(status: 1).order(created_at: :desc).limit(@limit)
  	end
  end  

  def myindex  	
  	redirect_to adv_list_index_path only_my: "1"
  	#@adv = Advert.find_by(user_id: 1)
  end  

  def info    
  end  

  def invite
  end  

  def send_invite

    @email = params[:email]

    if ( @email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i )      
      #@user = User.find_by(id: session[:user_id])
      #UserNotifier.confirmation(@user).deliver
      redirect_to adv_list_invite_path, alert: "Приглашение успешно отправлено!"
    else 
      redirect_to adv_list_invite_path, alert: "Ошибка отправки приглашения: Неверный Email!"       
    end    
  end  
end
