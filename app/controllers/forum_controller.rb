class ForumController < ApplicationController
  def index

  	if params[:limit]  		
  		@limit = params[:limit].to_i
  	else
  		@limit = 5  	
  	end

  	@msg = Message.order(created_at: :desc).limit(@limit)
  	@message = Message.new
  end
end
