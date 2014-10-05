# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
	before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  protected
    helper_method :admin_rights?

    def admin_rights?
      return User.find(session[:user_id]).administrator?           
  end

  protected
  	def authorize
  		unless User.find_by(id: session[:user_id])  	
  		  redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
  	end
  end

  protected
    def authorize_admin
      unless (User.find_by(id: session[:user_id]).name == 'admin')
        redirect_to login_url, notice: "Для данной операции требуется вход под учетной записью администратора"
    end    
  end

end
