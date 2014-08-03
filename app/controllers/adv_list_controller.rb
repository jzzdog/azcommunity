class AdvListController < ApplicationController
  def index
  	@adv = Advert.order(:created)
  end

  def get_user_info(adv)
  	@info = User.find_by(id: adv.user_id).name
  end
end
