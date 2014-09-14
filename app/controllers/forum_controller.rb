# -*- encoding : utf-8 -*-
class ForumController < ApplicationController
  def index  	
  	
  	@msg_list = Message.order(created_at: :desc).limit(5)
  	@message = Message.new
  end

  def showmore
  	respond_to do |format|
      
      @limit = params[:limit].to_i || 5 

      @msg_list = Message.order(created_at: :desc).limit(@limit)
      @message = Message.new
  		#format.html { redirect_to forum_index_url limit: @limit}
  		format.js
  		#format.json { render action: 'index', status: :created, location: @message }      

  	end
  end
end
