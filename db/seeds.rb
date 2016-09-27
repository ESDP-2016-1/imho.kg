# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(name: 'Admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456', dob: '1994/06/14', gender_id: 1, city_id: 2)
gender = Gender.create(name: 'мужской')
gender = Gender.create(name: 'женский')

city = City.create(name: 'Талас')
city = City.create(name: 'Нарын')
city = City.create(name: 'Чуй')
city = City.create(name: 'Ыссык-Кол')
city = City.create(name: 'Баткен')
city = City.create(name: 'г.Жалал-Абад')
city  = City.create(name:'г.Бишкек')
city  = City.create(name:'г.Кант')
city  = City.create(name:'г.Ош')