# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Advert.delete_all
Advert.create!(title: 'Антидождь Aquapel',
  description: 
    %{<p>
        Антидождь Аквапель (Aquapel) (оригинал США). Что это, и как 
        работает расписывать не буду, в инете куча инфо. Остерегайтесь 
        дешёвых подделок. Как отличить оригинал (США) от китайской подделки, 
        есть ролики, смотрим и проверяем.
      </p>},
  image_url:   'aquapel.png',  
  price: 300.00,
  user_id: 1)
# . . .
Advert.create!(title: 'Programming Ruby 1.9 & 2.0',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
  price: 49.95,
  user_id: 1)
# . . .

Advert.create!(title: 'Rails Test Prescriptions',
  description: 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  image_url: 'rtp.jpg',
  price: 34.95,
  user_id: 1)


