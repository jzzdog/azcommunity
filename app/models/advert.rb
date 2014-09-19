class Advert < ActiveRecord::Base
	has_attached_file :photo,
	  styles: { medium: "300x300>"}, 
    url: "/assets/adverts/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/adverts/:id/:style/:basename.:extension"        

	validates_attachment_content_type :photo, content_type: %w(image/jpeg image/png)

  STATUSES = %w(Не\ установлен Активное Истекшее Закрытое)

	def get_image_url
		return image_url if image_url 

		photo.url(:medium) ? photo.url(:medium) : 'Box_Empty.png'
	end

	def status_title
  	STATUSES[status] 
  end
end
