# -*- encoding : utf-8 -*-
#http://media.pragprog.com/titles/rails4/code/rails40/depot_r/app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  	@info = "Введите свой логин и пароль, если вы уже участник сообщества. 
      Либо зарегистрируйтесь, если у вас еще нет учетной записи"    
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      if user.status == -1
        redirect_to login_url, alert: "Указанна учетная запись не подтверждена. 
        Письмо с подтверждением отправлено на email, указанный при регистрации. 
        Если письмо с подтверждением не пришло, проверьте не попало ли оно в спам. 
        Если в папке со спамом пиьсма нет, то напшите нам об этом на allianz.community@gmail.com"  
      else
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to adv_list_index_url
        else 
          redirect_to login_url, alert: "Неверная комбинация имени и пароля"  
        end
      end
    else
      redirect_to login_url, alert: "Пользователь с указанным именем не зарегистрирован в системе"        
    end
  end

  def destroy
    session[:user_id] = nil
  	redirect_to adv_list_index_url, notice: "Сеанс завершен"
  end
end
