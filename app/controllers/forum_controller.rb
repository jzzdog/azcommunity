class ForumController < ApplicationController
  def index
  	@msg = Message.order(created_at: :desc).limit(10)
  	@message = Message.new
  end
end
