
#---------------------  GENDERS -----------------------------

  Gender.create(name: 'мужской')
  Gender.create(name: 'женский')

#-------------------- CITIES --------------------------------

  City.create(name: 'г. Бишкек')
  City.create(name: 'г. Талас')
  City.create(name: 'г. Нарын')
  City.create(name: 'г. Чуй')
  City.create(name: 'г. Ыссык-Кол')
  City.create(name: 'г. Баткен')
  City.create(name: 'г. Жалал-Абад')
  City.create(name: 'г. Кант')
  City.create(name: 'г. Ош')

#--------------------  ROLES ----------------------------------

  Role.create(name:'user')
  Role.create(name:'agent')
  Role.create(name:'moderator')
  Role.create(name:'admin')

#--------------------  COMPANY ------------------------------

  Company.create(title:             'Beeline',
                 description:       '#1 company in mobile service',
                 address:           'ул. Киевская 65',
                 phones:            '0(312)979888;0(312)665566',
                 email:             'info@beeline.kg',
                 website:           'beeline.kg',
                 working_hours:     'Пн-Пт (9:00-17:00)',
                 registration_year: '2006',
                 city:               City.all.first)

  Company.create(title:             'Megacom',
                 description:       'We are the leader in mobile service',
                 address:           'ул. Дзержинского 65',
                 phones:            '0(312)656565;0(312)555444',
                 email:             'info@megacom.kg',
                 website:           'megacom.kg',
                 working_hours:     'Пн-Пт (10:00-18:00)',
                 registration_year: '2002',
                 city:               City.all.first)

#---------------------  USERS ---------------------------------

  User.create(name:                  'Admin',
              email:                 'admin@example.com',
              password:              '123456',
              password_confirmation: '123456',
              dob:                   '1994/06/14',
              gender_id:             1,
              city_id:               2,
              active:                true,
              role_id:               City.all.first)

  User.create(name:                  'Min',
              email:                 'min@example.com',
              password:              '123456',
              password_confirmation: '123456',
              dob:                   '1994/06/14',
              gender_id:             1,
              city_id:               2,
              active:                true,
              role_id:               City.all.first)
