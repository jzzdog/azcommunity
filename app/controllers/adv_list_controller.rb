class AdvListController < ApplicationController
  def index
  	@adv = Advert.order(:user_id)
  end
end
