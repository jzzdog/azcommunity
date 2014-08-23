# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  has_secure_password
  validates :name, :mail, presence: true
  validates :name, uniqueness: true
  validates :mail, allow_blank: true, format: {
    with: %r{\A(\S+)(manishchenko@gmail.com|@allianz.ru)\Z}i,
    message: 'Почтовый адрес должен быть в формате example@allianz.ru'
  }

  def get_user_info()
  	office_list = [
  		'Без офиса',
  		'Озерковская набережная',
  		'Варшавское шоссе'
  	]

  	@info = name + ' (' + office_list[office] + ')'
  end

  def generate_confirm_hash()
  	o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	confirm_hash = (0...15).map { o[rand(o.length)] }.join	
  end
end
