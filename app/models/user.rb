# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "180x180>", :thumb => "60x60>"}, 
        :default_url => "/images/:style/unknown_user.png",
        :url  => "/assets/users/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"        

  #validates_attachment_presence :photo
  #validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  validates :name, :mail, presence: true
  validates :name, uniqueness: true
  validates :mail, allow_blank: true, format: {
    with: %r{\A(\S+)(manishchenko@gmail.com|@allianz.ru)\Z}i,
    message: 'Почтовый адрес должен быть в формате example@allianz.ru'
  }
  OFFICES = %w(Без\ офиса Озерковская\ набережная Варшавское\ шоссе)

  def get_user_info()
  	"#{name} (#{OFFICES[office]})"
  end

  def office_name
    "#{OFFICES[office]}"
  end

  def ava_url    
    avatar.url(:thumb)
  end

  def ava_url_medium
    avatar.url(:medium)
  end

  def generate_confirm_hash()
  	o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	  (0...15).map { o[rand(o.length)] }.join	
  end

  def administrator?
    return (name == 'admin')    
  end

end
