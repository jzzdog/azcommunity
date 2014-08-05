class User < ActiveRecord::Base
  has_secure_password

  def get_user_info()
  	office_list = [
  		'Без офиса',
  		'Озерковская набережная',
  		'Варшавское шоссе'
  	]

  	@info = name + ' (' + office_list[office] + ')'
  end
end
