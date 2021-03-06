# -*- encoding : utf-8 -*-
class Advert < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x300>"}, 
		#:default_url => "/images/:style/missing.png"
        :url  => "/assets/adverts/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/adverts/:id/:style/:basename.:extension"        

	#validates_attachment_presence :photo
	#validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def get_image_url
		return image_url if image_url
		photo.url(:medium) ? photo.url(:medium) : 'Box_Empty.png'
	end

	def get_status_name()
  	status_list = [
  		'Не установлен',
  		'Активное',
  		'Истекшее',
  		'Закрытое'
  	]

  	if status
  		@status_name = status_list[status] 
  	end
  end
end
