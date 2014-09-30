# -*- encoding : utf-8 -*-
#encoding: utf-8

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
  user_id: 1,
  status: 1)
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
  user_id: 2,
  status: 1)
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
  user_id: 2,
  status: 1)

User.delete_all
User.create!(id: 0,
  name: 'admin',
  mail: 'admin@allianz.ru',
  password: 'admin',
  password_confirmation: 'admin',
  office: 1,
  phone: '1234')

User.create!(id: 1,
  name: 'steve',
  mail: 'steve@allianz.ru',
  password: '1qazXSW@',
  password_confirmation: '1qazXSW@',
  office: 1,
  phone: '1234')

User.create!(id: 2,
  name: 'dave',
  mail: 'dave@allianz.ru',
  password: '1qazXSW@',
  password_confirmation: '1qazXSW@',
  office: 2,
  phone: '6564')

Message.delete_all
Message.create!(title: 'Всем привет!',
  body: 
    %{
        Хочу поприветствовать всех коллег и пожелать хорошего дня и отличного
        настроения на всю неделю!
      },  
  user_id: 2,
  office_id: 1,
  status: 0)

Message.create!(title: 'Всем привет!',
  body: 
    %{Привет Дейв!},  
  user_id: 1,
  office_id: 1,
  status: 0)

Topic.delete_all
Topic.create!(id: 1, name: 'Для тех, кто работает в офисе на Варшавке')
Topic.create!(name: 'Для тех, кто работает в офисе на Озерковке')
Topic.create!(name: 'Страхование')
Topic.create!(name: 'Посмеяться')
Topic.create!(name: 'Судьба компании')
Topic.create!(name: 'Другое')


Post.delete_all
Post.create!(title: 'Расписание маршуток',
  body: 'Текст расписания маршруток',
  user: User.find(1),
  topic: Topic.find(1))


