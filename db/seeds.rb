# frozen_string_literal: true

user = User.create!(login: 'cool-net', password: 'my_password')

user2 = User.create!(login: 'cool-net2', password: 'my_password2')

categories = Category.create!([{ title: 'Люди' }, { title: 'Животные' }])

tests = Test.create!([
               { title: 'Образование', level: 1, category: categories[0], author: user2 },
               { title: 'Здоровье', level: 2, category: categories[0], author: user2 },
               { title: 'Особенности', level: 1, category: categories[1], author: user },
               { title: 'Виды', level: 2, category: categories[1], author: user }
])

questions = Question.create([
               { body: 'Самое большое животное жившее на земле?', test: tests[2] },
               { body: 'способы укрепить эммунитет?', test: tests[1] },
               { body: 'Самое быстрое животное жившее на земле из современных?', test: tests[2] }
])

Answer.create!([
               { body: 'Слон', question: questions[0] },
               { body: 'Дипладок', question: questions[0] },
               { body: 'Синий кит', question: questions[0] },
               { body: 'Брахиозавр', question: questions[0] }
])

UserConnectionTest.create([
               { user: user, test: tests[0] },
               { user: user, test: tests[1] },
               { user: user, test: tests[2] },
               { user: user, test: tests[3] }
])

Test.create!( title: 'existing test', category: categories[1], author: user)

Test.create!(title: 'does_not_have_a_category', author: User.find_by(login: 'cool-net2'))

