class AdvListController < ApplicationController
  def index
  	@adv = Advert.order(:created)
  end  
end
