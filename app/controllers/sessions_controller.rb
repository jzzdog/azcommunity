#http://media.pragprog.com/titles/rails4/code/rails40/depot_r/app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  	
  end

  def create
    user = User.find_by(name: params[:name])
    if user.status == -1
      redirect_to login_url, alert: "Указанна учетная запись не подтверждена. 
      Письмо с подтверждением отправлено на email, указанный при регистрации. 
      Если письмо с подтверждением не пришло, проверьте не попало ли оно в спам. 
      Если в папке со спамом пиьсма нет, то напшите нам об этом на allianz.community@gmail.com"  
    else
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
    		redirect_to adv_list_index_url
    	else 
    		redirect_to login_url, alert: "Неверная комбинация имени и пароля"  
    	end
    end

  end

  def destroy
    session[:user_id] = nil
  	redirect_to adv_list_index_url, notice: "Сеанс завершен"
  end
end
