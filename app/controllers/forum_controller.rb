# -*- encoding : utf-8 -*-
class ForumController < ApplicationController
  def index  	  	
  	@topics = Topic.all
  end  
end
