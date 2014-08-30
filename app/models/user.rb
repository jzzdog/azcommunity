class User < ActiveRecord::Base
  has_secure_password

  validates :name, :mail, presence: true
  validates :name, uniqueness: true
  validates :mail, allow_blank: true, format: {
    with: %r{\A(\S+)(manishchenko@gmail.com|@allianz.ru)\Z}i,
    message: 'Почтовый адрес должен быть в формате example@allianz.ru'
  }
  
  OFFICES = %w(Без\ офиса Озерковская\ набережная Варшавское\ шоссе)

  def full_name
   "#{name} (#{OFFICES[office]})"
  end

  def confirm_hash
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...15).map { o[rand(o.length)] }.join	
  end
end
