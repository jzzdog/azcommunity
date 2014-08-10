class AdvListController < ApplicationController
  def index
  	@adv = Advert.order(created_at: :desc)
  end  
end
