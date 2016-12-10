generate_amount_companies = 50
generate_amount_head_comments = 150
generate_amount_sub_comments = 200
generate_amount_users = 20
line_width = 60

puts
puts 'CLEARING ALL DATA'

User.destroy_all
puts 'CLEARED: User entities'
Ucomment.destroy_all
puts 'CLEARED: Ucomment entities'
Favorite.destroy_all
puts 'CLEARED: Favorite entities'
Vote.destroy_all
puts 'CLEARED: Vote entities'
City.destroy_all
puts 'CLEARED: City entities'
Role.destroy_all
puts 'CLEARED: Role entities'
Category.destroy_all
puts 'CLEARED: Category entities'
Gender.destroy_all
puts 'CLEARED: Gender entities'
Company.destroy_all
puts 'CLEARED: Company entities'
puts 'ALL ENTITIES CLEARED!'
puts



  puts
  puts "SEEDS STARTED:"
  puts ("-" * line_width)
  puts
#---------------------  GENDERS -----------------------------

  puts "CREATED GENDER: #{Gender.create(name: 'мужской').name}"
  puts "CREATED GENDER: #{Gender.create(name: 'женский').name}"
  puts


#-------------------- CITIES --------------------------------

  cities = ['г. Бишкек', 'г. Талас', 'г. Нарын', 'г. Чуй', 'г. Ыссык-Кол', 'г. Баткен', 'г. Жалал-Абад', 'г. Кант', 'г. Ош']
  cities.each do |city|
    City.create(name: city)
    puts"CREATED CITY: #{city}"
  end
  puts


#--------------------  ROLES ----------------------------------

  ['user', 'agent', 'moderator', 'admin', 'banned'].each do |role|
    Role.create(name: role)
    puts "CREATED ROLE: #{role}"
  end
  puts


#---------------------  USERS ---------------------------------

['user', 'agent', 'moderator', 'admin'].each_with_index do |name, n|
    email = name + '@example.com'
    password = '123456'
    User.create(  name: name,
                  email: email,
                  role_id: n+1,
                  password: password,
                  password_confirmation: password,
                  confirmed_at: Time.now )
    print "\x1b[0;32m"
    puts "CREATED USER -> #{name} WITH ROLE = #{name} AND PASSWORD: #{password}"
    print "\x1b[0m"
  end
  puts "\n"

  cat_id = Category.create(title:'Интернет')
  main_category = Category.create(title:'Разработка', topcategory_id: cat_id.id)

  user=Array.new
  user[1] = User.create( name: 'Мара @VIP', email: 'mara_official@vipmail.ru', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now , :avatar => File.new("#{Rails.root}/public/images/vip.jpg") )
  user[2] = User.create( name: 'Аня Boobs5', email: 'boobs5555@mail.ru', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now,  :avatar => File.new("#{Rails.root}/public/images/boobs.jpg") )
  user[3] = User.create( name: 'Депутат Нурчик', email: 'lexus5555@jk.kg', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now, :avatar => File.new("#{Rails.root}/public/images/deputy.jpg") )
  user[4] = User.create( name: 'Самат юрист', email: 'sam_law234@gmail.com', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now, :avatar => File.new("#{Rails.root}/public/images/law.jpg"))
  user[5] = User.create( name: 'Фотограф', email: 'photo_man343@photo.com', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now, :avatar => File.new("#{Rails.root}/public/images/photography.jpg"))
  user[6] = User.create( name: 'Валенитин Властелин', email: 'valentino@emperor.com', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now, :avatar => File.new("#{Rails.root}/public/images/val.jpg"))
  user[7] = User.create( name: 'Саня Стопудовый', email: 'sanya_kg3443@gmail.com', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now,  :avatar => File.new("#{Rails.root}/public/images/money.png"))
  user[8] = User.create( name: 'CODER-TROLL', email: 'troll34344@gmail.com', role_id: 1, password: 'asdfasdf', password_confirmation: 'asdfasdf', confirmed_at: Time.now,  :avatar => File.new("#{Rails.root}/public/images/code.png") )


  company = Array.new
  company[1] = Company.create( title: 'Жарайт CODING',
                               description:  'Вообщем если вы хотите шикарный дизайн от Нурлан АйАзамата и отличный сайт сделанный лучшими программистами KG то тогда мы это то что вы ищете',
                               address: 'Ахунбайка 82',
                               phones: '6554232',
                               email: 'jarait_code@mail.ru',
                               website: 'jarait.narod.ru',
                               working_hours: 'Всегда работаем',
                               registration_year: '2011' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[2] = Company.create( title: '!СпалМного ЕлМало',
                               description:  'Мы хорошо программируем мало спим много едим, для тех кто не понял знак ! - это отрицание. Так что типа reverse. Короче для тех кто понял: мы всегда рады клиентам и гостям.',
                               address: 'Киевская 0xF4A2',
                               phones: '9494411',
                               email: 'not_spalmnogo_elmalo@splyu.em',
                               website: 'splyu.em',
                               working_hours: '9:00-18:00',
                               registration_year: '2010' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[3] = Company.create( title: 'CODE Трактор',
                               description:  'Если есть деньги и нужен хороший продукт, закажите у нас тех. задание, потом закажите у нас сайт, потом закажите у нас обслуживание или можете заказать у нас курсы и сделать всё сами. Вообщем у нас без заказа не обойдется и без больших денег лучше не приходите! ',
                               address: 'Малдыбаева 0xA4F0',
                               phones: '8881750',
                               email: 'traktorist_v_it@tractor.kg',
                               website: 'code-tractor.kg',
                               working_hours: '9:00-21:00',
                               registration_year: '2008' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[4] = Company.create( title: 'ZEMеля SOFT',
                               description:  'ЗЕМеля SOFT это лучший ЖабаСкрипт разработчик в KG. Мы можем всё. Если не можешь обуздать Жабу, приходи к нам мы знаем как укротить её. ЗЕМ SOFT и Жаба это то что тебе нужно поверь!',
                               address: 'Ахунбаева 444',
                               phones: '8848443',
                               email: 'zemelya@zema.kg',
                               website: 'zema.kg',
                               working_hours: '9:00-18:00',
                               registration_year: '2012' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[5] = Company.create( title: 'Шкодер',
                               description:  'У нас разрабатывают те кто только что у нас отучились. Кто-то называет нас Говнокодерами - они просто завидуют. Приходите и мы покажем с какой скоростью наши выпускники пишут Hello World приложения. Наша разработка - Ваш промах(точнее размах)',
                               address: 'Звоните места меняются',
                               phones: '8823334',
                               email: 'shcoder@gcode.kg',
                               website: 'gcode.kg',
                               working_hours: 'когда надо',
                               registration_year: '2012' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[6] = Company.create( title: 'Jooma Генератор',
                               description:  'Я Жома Генератор. Я генерирую шикарные сайты  которые имеют шикарный дизайн и для этого у меня уходит в разы меньше времени чем у других IT компаний. Я учился в ШКОДЕР! Джома Генератор - Быстро, Качественно, Недорого! Звони всегда',
                               address: '15мрн., д.55, кв.11',
                               phones: '2334232',
                               email: 'joma_hacker@hackzone.ru',
                               website: 'joma.joomla.com',
                               working_hours: '8:00-8:00',
                               registration_year: '2013' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[7] = Company.create( title: 'ВордПрессер MEGA',
                               description:  'Мы выполняем быстрое написание сайтов. Реально быстро! Если вам нужен качественный сайт то тогда вам к нам. Однажны вы проснётесь знаменитым благодаря вашему сайту и придёте отблагодарить нас!',
                               address: 'Советская 111/333',
                               phones: '9494944',
                               email: 'anya@mail.ru',
                               website: 'mega_wp.freezone.com',
                               working_hours: '',
                               registration_year: '' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[8] = Company.create( title: 'AK-FART',
                               description:  'Модератор(IMHO.KG): Связаться с представителями компании не удалось. Компания занимается разработкой приложения для ПК и Бизнес систем. Судя по всему имеет не совсем экологиную обстановку внутри компании. Деятельность весьма обширная',
                               address: 'Новоуличная 33',
                               phones: '3434443',
                               email: 'ilikefart@fartuvsem.kg',
                               website: 'fartuvsem.kg',
                               working_hours: '9:00-16:00',
                               registration_year: '2012' ,
                               city_id: 1,
                               category_id: main_category.id)

  company[9] = Company.create( title: 'G-EST SOFT',
                               description:  'Жи Ест Софт это реальное решение, реальных проблем в IT и не только. Вообщем всё реально. Если нужен код мы найдем(наймем) лучших программистов и сделаем им предложение от которого они не смогут отказаться. И реально запилим вам сайт и чё там ещё надо. Также принимаем долговыми обязательствами по курсу 50%',
                               address: 'Звоните',
                               phones: '5555555',
                               email: 'realnye_g_est_kg@gmail.com',
                               website: 'realnogest.me',
                               working_hours: 'Круглосуточно',
                               registration_year: '0001' ,
                               city_id: 1,
                               category_id: main_category.id)


comment = Array.new

#------------------------------------------------------- MARA @VIP -------------------------------------------------
cur_user = 1

# Жарайт Coding
comment.push Ucomment.create( title:  'Короче чётким туда лучше не заходить' ,
                              body:   'Подбежал какой-то паренёк в колпаке и начал нам впаривать уже готовый чей-то сайт. Сказал что сделают "Отдуши". Чёта нас смутила фраза "Жарайт болот"' ,
                              positive:  false,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 2,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'Короче компания не очень. Отстой' ,
                              body:   'Короче Я и моя бэйба пришли к ним заказать сайт типа где мы вдвоём и типа лав стори. Типа Я такой весь такой чёткий и она тожe. Короче там есть один Миша. Послал нас нахуй' ,
                              positive:  false,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 2,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
comment.push Ucomment.create( title:  'Комания эта не чёткая' ,
                               body:   'Здесь меня начали спрашивать про тех.обслуживание или тех.задание не помню. Короче мы друг друга не вдуплили и я укатил' ,
                               positive:  false,
                               company_id: company[3].id,
                               user_id: user[cur_user].id,
                               rate: 3,
                               topucomment_id: nil,
                               created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# ZEMеля SOFT
comment.push Ucomment.create( title:  'Хорошая компания душевные пацаны' ,
                              body:   'Подтянулись ребята порешали с моей бэйбой чё и как она хочет. Она им всё разжевала. Подогнали нам чаю пообщались за жизнь короче хорошая компания но не хотим у них заказывать.',
                              positive:  true,
                              company_id: company[4].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Шкодер
comment.push Ucomment.create( title:  'Вы чё внатуре студентиков посадили' ,
                              body:   'Заходим мы короче подбегает к нам студентик такой типа: "Чё накодить?". Мы попутали. Но когда он начала набирать текст указательными пальцами чёта мы передумали заказывать сайт',
                              positive:  false,
                              company_id: company[5].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Joma Generator
comment.push Ucomment.create( title:  'Не открыл дверь!' ,
                              body:   'Жома я не твой старый клиент. Я новый клиент. Ты чё дверь не открывал. Я видел как ты в глазок таращился. Камеру повесь уже.',
                              positive:  false,
                              company_id: company[6].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# Word Presser
comment.push Ucomment.create( title:  'Короче не понравились' ,
                              body:   'Начали подбегать с какими то шаблонами. Я нихера не понял и уехал а всего-лишь хотел сайт с бэйбой',
                              positive:  false,
                              company_id: company[7].id,
                              user_id: user[cur_user].id,
                              rate: 3,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# AK-FART
comment.push Ucomment.create( title:  'Не заходите туда, созванивайтесь' ,
                              body:   'Короче моя бейба туда гоняла. За сайтом. И пока она там сидела у неё башка закружилась, вышла проблевалась.' ,
                              positive:  false,
                              company_id: company[8].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# G-EST SOFT
comment.push Ucomment.create( title:  'Атвичаю жи есть чёткая компания.' ,
                               body:   'Вообщем прикатили мы туда. Там всё в поряде. Встретил нас байкеша весь такой чёткий/дерский. Сказал ща всё решит по сайту. Через полчаса затащили программиста он нам за полчаса всё сделал!' ,
                               positive:  true,
                               company_id: company[9].id,
                               user_id: user[cur_user].id,
                               rate: 5,
                               topucomment_id: nil,
                               created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )



#------------------------------------------------------- Аня Boobs5 -------------------------------------------------
cur_user = 2

# Жарайт Coding
comment.push Ucomment.create( title:  'Я ничего не поняла что они мне говорили' ,
                              body:   'Подбежали десять человек. Кто про деньги спрашивает. Кто про сайт. Кто про сумку. Но сумка у меня действительно классная :)' ,
                              positive:  false,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'Ребята хорошие, но внимание девушкам оказывать не умеют' ,
                              body:   'Вообщем я такая вся при параде захожу к ним а они 0 внимания. Всё вроде красиво объяснили. Но внимания как девушке совсем не уделили. Только сайты там всякие их интересуют' ,
                              positive:  true,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 4,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
comment.push Ucomment.create( title:  'Мне понравилось' ,
                              body:   'Вообщем я хотела сайт а получилось что мне между строк дали понять что я блондинка и тактично меня выпроводили. Хорошая компания. Перекрашусь пойду к ним ещё раз может тогда их пойму.' ,
                              positive:  true,
                              company_id: company[3].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# ZEMеля SOFT
comment.push Ucomment.create( title:  'Уважительно относятся к клиентам' ,
                              body:   'Мне очень понравилось их отношение гостепреимство. Правда я забыла что пришла к ним заказать сайт. Но до сайта так дело не дошло. Посидели пообщались. Буду заходить к ним в гости.',
                              positive:  true,
                              company_id: company[4].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Шкодер
comment.push Ucomment.create( title:  'Как они вообще заказы принимают' ,
                              body:   'Пришла к ним. Они как меня увидели все попрятались. Такое ощущение что я налоговый инспектор или судебный исполнитель. Вообщем никто меня не решился спросить зачем я зашла и я в итоге ушла',
                              positive:  false,
                              company_id: company[5].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Joma Generator
comment.push Ucomment.create( title:  'Такая же история как со Шкодером' ,
                              body:   'Я позвонила в дверь. Кто-то пристально смотрел в глазок но так и не открыл дверь. Я ушла. Тяжело быть красивой',
                              positive:  false,
                              company_id: company[6].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# Word Presser
comment.push Ucomment.create( title:  'Ужасный подход к клиентам' ,
                              body:   'Я только зашла как все накинулись показывать их сайты, картинки. Один парень меня фотографировать начал. Злая на них',
                              positive:  false,
                              company_id: company[7].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# AK-FART
comment.push Ucomment.create( title:  'Проветривайте помещение' ,
                              body:   'Невозможно было сидеть такое ощущение что сидишь среди протухщих фруктов. Не выдержала, убежала. Но картинка с котиками на входе мне понравилась' ,
                              positive:  false,
                              company_id: company[8].id,
                              user_id: user[cur_user].id,
                              rate: 3,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# G-EST SOFT
comment.push Ucomment.create( title:  'Сволочи! Я написала заявление в милицию' ,
                              body:   'Встретил меня молодой человек в костюме при галстуке очень вежливо общались. Обменялись телефонами даже. А потом когда я вышла обнаружила что мой телефон пропал! А у меня был iPhone 7!!! Ненавижу уроды.' ,
                              positive:  false,
                              company_id: company[9].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )




#------------------------------------------------------- Депутат Нурчик -------------------------------------------------
cur_user = 3

# Жарайт Coding
comment.push Ucomment.create( title:  'мне это. понравилось всё.. нормально' ,
                              body:   'ребята такие веселые, кумысом напоили. один правда денег просить в долг начал но я подумал помощником его сделаю, красиво спел мне песню Жамгыр Токту'  ,
                              positive:  true,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'не знают кто я.' ,
                              body:   'я сказал что хочу сайт. они мне "что вы именно хотите и в этом роде короче". я им сказал что хочу сайт как у моего друга Жапара только круче короче начали меня отшивать. буду добиваться в жк чтоб всех айтишников в кулак взяли. расслабились' ,
                              positive:  false,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
comment.push Ucomment.create( title:  'дорого считаете ребята, слуга народа должен проходить со скидкой' ,
                              body:   'были такие хорошие ребята пока не сказали что я должен заплатить за какой-то сайт несколько тысяч долларов. вообщем не договорились.' ,
                              positive:  true,
                              company_id: company[3].id,
                              user_id: user[cur_user].id,
                              rate: 3,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# ZEMеля SOFT
comment.push Ucomment.create( title:  'ай молодцы чаем напоили' ,
                              body:   'вот сразу видно хорошие ребята как зашёл сразу чай-пай разговоры. вообщем ко мне на запись записались. сказали что на днях барана резать будут меня пригласили. про сайт-шмайты не общались',
                              positive:  true,
                              company_id: company[4].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Шкодер
comment.push Ucomment.create( title:  'надо быть увереннее' ,
                              body:   'зашел к ним сказал сайт нужен. братишка один подбежал трясётся весь заикается сразу видно узнал. карочи ничё я не понял, уехал. но понравилось что вот такая молодёж у нас',
                              positive:  true,
                              company_id: company[5].id,
                              user_id: user[cur_user].id,
                              rate: 4,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Joma Generator
comment.push Ucomment.create( title:  'ээ тибя не учили дверь открывать когда к тебе депутат пришёл' ,
                              body:   'звоню в дверь не открывает. хотел спецназ вызвать(свой) потом передумал. потом слышу голос из-за двери говорит Жома здесь больше не живёт. уехал',
                              positive:  false,
                              company_id: company[6].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# Word Presser
comment.push Ucomment.create( title:  'мой старый сайт не работает. я вас всех закрою' ,
                              body:   'сказал братишке у них сайт сделать 2 года назад. захотел на себя посмотреть про себя почитать захожу а он не работает. отправил братишек к ним. они деньги вернули но сайт то не работает!',
                              positive:  false,
                              company_id: company[7].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# AK-FART
comment.push Ucomment.create( title:  'предложили сделать программу на комьютер' ,
                              body:   'заказал. у Жапара, моего кента, такой программы нету на заседании жк в следущий раз покажу пусть утрётся со своим сайтом-визиткой' ,
                              positive:  true,
                              company_id: company[8].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# G-EST SOFT
comment.push Ucomment.create( title:  'свои ребята' ,
                              body:   'заехал смотрю все свои ребята там Бакыт(Прыткий), Мага(Левша), Айба(Терминатор) все свои пацаны. сказали любой сайт разрулят за полчаса.' ,
                              positive:  true,
                              company_id: company[9].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )



#------------------------------------------------------- Самат Юрист -------------------------------------------------
cur_user = 4

# Жарайт Coding
comment.push Ucomment.create( title:  'нету акта сдачи-приёмки, нету договоров' ,
                              body:   'нету никаких документов я как понял не ведётся даже бухгалтерия!'  ,
                              positive:  false,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'с документооборотом вроде всё нормально' ,
                              body:   'заказал сайт. вроде делают после акта-выполненных работ отпишусь здесь' ,
                              positive:  true,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
=begin
comment.push Ucomment.create( title:  'очень дорого но полный порядок с документами!' ,
                              body:   'с документами полный порядок ' ,
                              positive:  true,
                              company_id: company[3].id,
                              user_id: user[cur_user].id,
                              rate: 3,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )
=end

# ZEMеля SOFT
comment.push Ucomment.create( title:  'заказал у них приложение на телефон' ,
                              body:   'хороший менеджмент, надеюсь будет хороший продукт',
                              positive:  true,
                              company_id: company[4].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Шкодер
comment.push Ucomment.create( title:  'бардак в документообороте' ,
                              body:   'понарвилось что пишут молодые ребята',
                              positive:  true,
                              company_id: company[5].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Joma Generator
comment.push Ucomment.create( title:  'отличное соотношение цена/качество' ,
                              body:   'за 200$ получил сайт визитку. дёшево и сердито',
                              positive:  true,
                              company_id: company[6].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# Word Presser
comment.push Ucomment.create( title:  'сайт взломали!' ,
                              body:   'заказал сайт полгода назад у них сайт, его через месяц взломали а они мне отписались что не оказывают поддержку. подал на них в суд!',
                              positive:  false,
                              company_id: company[7].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# AK-FART
comment.push Ucomment.create( title:  'отличная компания' ,
                              body:   'написали приложение на мой телефон. в связи с тем что я работаю юристом мне отлично подошло их приложение для ТОКТОМ на мобильном устройстве' ,
                              positive:  true,
                              company_id: company[8].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# G-EST SOFT
comment.push Ucomment.create( title:  'не в коем случае туда не ходите!' ,
                              body:   'я сразу почуял что-то не ладное когда меня встретил человек в костюме и очках. назвался Эркином. спросил чем я занимаюсь, где живу, сколько зарабатываю. когда я собрался уже уходить он мне сказал что они могут решить мои проблемы не только с сайтом. я в шоке' ,
                              positive:  false,
                              company_id: company[9].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )




#------------------------------------------------------- Фотограф -------------------------------------------------
cur_user = 5

# Жарайт Coding
comment.push Ucomment.create( title:  'Это не компания! Не взумайте туда обратиться' ,
                              body:   'Показали то что нельзя назвать дизайном или сайтом. Сказали что это ИННОВАЦИОННЫЙ ПОДХОД от Жарайт CODING. Стиль - МИНИМУМ! Вообщем сами сделайте свои выводы фото их работ я приложил'  ,
                              positive:  false,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'Всё отлично! Мне понравилось!' ,
                              body:   'Ребята показали свои сайты. Очень понравилось. Очень доволен. Всем рекомендую!' ,
                              positive:  true,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
comment.push Ucomment.create( title:  'Хорошая компания' ,
                              body:   'Дизайн правда хромает. Мне как эксперту в области фото обработки показались странными их решения но в целом создают хорошие приложения. ' ,
                              positive:  true,
                              company_id: company[3].id,
                              user_id: user[cur_user].id,
                              rate: 4,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# ZEMеля SOFT
comment.push Ucomment.create( title:  'Сделали ужасный сайт!' ,
                              body:   'Ничего нормально не работает, мои работы загружаются в плохом качестве! Недоволен! Не рекомендую!',
                              positive:  false,
                              company_id: company[4].id,
                              user_id: user[cur_user].id,
                              rate: 2,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Шкодер
comment.push Ucomment.create( title:  'Хорошая компания тем что работают молодые парни' ,
                              body:   'Приехал к ним в компанию. Пообщался с молодыми ребятами которые как мне показалось знают хорошо то что они делают. Но так как мне необходимо качество+надежность пришлось с ними попрощаться.',
                              positive:  true,
                              company_id: company[5].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Joma Generator
comment.push Ucomment.create( title:  'Цена/Качество' ,
                              body:   'За совсем небольшую сумму 400$ согласился написать сайт для моих работ. Но предупредил чтоб я прежде чем приезжал звонил ему и в дверной звонок звонил три раза. Это меня немного смутило но за такие деньги получить сайт это волшебство',
                              positive:  true,
                              company_id: company[6].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# Word Presser
comment.push Ucomment.create( title:  'Их сайты тормозят' ,
                              body:   'При показе портфолио нормально не запустился ни один сайт. Никому не рекомендую',
                              positive:  false,
                              company_id: company[7].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


# AK-FART
comment.push Ucomment.create( title:  'Написали отлично приложение на планшет' ,
                              body:   'Часто я в работе использую планшет для презентации моих работ. Ребята выполнили работу на отлично. Теперь я могу показывать своё портфолио из облака!' ,
                              positive:  true,
                              company_id: company[8].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# G-EST SOFT
comment.push Ucomment.create( title:  'Забрали мой фотоаппарат, пригрозили расправой!' ,
                              body:   'Зашёл я к ним на приём. Встретили двое человек. Пока рассказывал им про то какой я сайт хочу один из них подошёл взял мой фотоаппарат и сказал другому что ему такой нужен. Я начал объяснять где можно такой купить на что они мне сказал "Свободен!". Не ходите туда!' ,
                              positive:  false,
                              company_id: company[9].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )


#------------------------------------------------------- Валентин -------------------------------------------------
cur_user = 6

# Жарайт Coding
comment.push Ucomment.create( title:  'сброд!' ,
                              body:   'Я официально заявляю что там один сброд! Я знаю что я говорю!!!'  ,
                              positive:  false,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'возомнили себя гуру программирования' ,
                              body:   'ТОЖЕ МНЕ УМНИКИ. считают себя пупом земли! сайты они делают! нихрена они делать не умеют!' ,
                              positive:  false,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# G-EST SOFT
comment.push Ucomment.create( title:  'ЗДЕСЬ МНЕ ДАЛИ ПИ*ДЫ!!!!!' ,
                              body:   'Не побили! А именно отпи*дили!!! С*ки вы за это ответите!!!! Валентин будет мстить!!!' ,
                              positive:  false,
                              company_id: company[9].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )



#------------------------------------------------------- Саня Стопудовый -------------------------------------------------
cur_user = 7

# Жарайт Coding
comment.push Ucomment.create( title:  'Хорошая компания!' ,
                              body:   'Если хочешь ЗАРАБОТАТЬ зайди на сайт JOY-MAGAZINO.COM вбей цифры которые высветятся на экране и СЫГРАЙ ЗА МОЙ СЧЁТ!'  ,
                              positive:  true,
                              company_id: company[1].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# SpalMnoho
comment.push Ucomment.create( title:  'Хорошая компания!' ,
                              body:   'В свои 25 лет я заработал миллион долларов США. Хочешь узнать как? Переходи на JOY-MAGAZINO.COM' ,
                              positive:  true,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
comment.push Ucomment.create( title:  'Хорошая компания!' ,
                              body:   'Набери 8282 и ПОЛУЧИ УНИКАЛЬНУЮ ВОЗМОЖНОСТЬ выиграть MercedesGL!!!' ,
                              positive:  true,
                              company_id: company[3].id,
                              user_id: user[cur_user].id,
                              rate: 5,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )



#------------------------------------------------------- Саня Стопудовый -------------------------------------------------
cur_user = 8


# SpalMnoho
comment.push Ucomment.create( title:  'говнокодеры' ,
                              body:   'я поднял десятки серваков с сайтами, я взломал ФСБ, а эти говнокодеры отказались взять меня к себе в проект' ,
                              positive:  false,
                              company_id: company[2].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )

# Code трактор
comment.push Ucomment.create( title:  'тоже говнокодеры' ,
                              body:   'не взяли меня к себе в проект! хотя они даже не могут ответить на загадку про три сундука и монеты!!!' ,
                              positive:  false,
                              company_id: company[3].id,
                              user_id: user[cur_user].id,
                              rate: 1,
                              topucomment_id: nil,
                              created_at: Faker::Time.between(DateTime.new(2016,2,3), DateTime.now)  )



puts "CREATED COMMENTS!"
  puts




#---------------------------  VOTES ------------------------------------

  user.each do |sel_user|
    comment.each do |sel_comment|
      if rand(1..10)>5
        Vote.add(sel_user, sel_comment, rand(1..10)>5 ? :like : :dislike)
      end
    end
  end


  puts "CREATED LIKES/DISLIKES!"
  puts






=begin
  3.times do |n|
    n += 1
    Ucomment.create(title: Faker::Lorem.sentence,
                    body: Faker::Lorem.sentence(3),
                    company_id:  rand(1..2),
                    user_id: 1,
                    topucomment_id: n
                    )

  end
=end
Company.reindex
puts "ELASTICSEARCH REINDEXED FOR COMPANY table"
puts
puts "*" * line_width
puts "SEEDS FINISHED SUCCESSFULLY!"
puts