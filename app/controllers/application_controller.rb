# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
	before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  protected
  	def authorize
  		unless User.find_by(id: session[:user_id])
  		#redirect_to sessions_create_url, notice: "Пожалуйста, пройдите авторизацию"
  		redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
  	end
  end
end
