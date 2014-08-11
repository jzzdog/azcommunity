class AdvListController < ApplicationController
  def index
  	if (params[:only_my] == "1")
  		@header_text = "Мои объявления"
  		@adv = Advert.where(user_id: session[:user_id]).order(created_at: :desc)
  	else
  		@header_text = "Объявления"
  		@adv = Advert.where(status: 1).order(created_at: :desc)
  	end
  end  

  def myindex  	
  	redirect_to adv_list_index_path only_my: "1"
  	#@adv = Advert.find_by(user_id: 1)
  end  
end
