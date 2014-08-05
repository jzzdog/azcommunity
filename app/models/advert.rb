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
end
