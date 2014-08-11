class Advert < ActiveRecord::Base
	def get_image_url
		if image_url != ''
			@url = image_url
		else			
			#@url = 'empty_product.jpg'
			@url = 'Box_Empty.png'
		end
		@url
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
