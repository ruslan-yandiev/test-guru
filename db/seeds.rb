# frozen_string_literal: true

categories = Category.create!([{ title: 'Люди' }, { title: 'Животные' }])

tests = Test.create!([
               { title: 'Образование', level: 1, category_id: categories[0].id },
               { title: 'Здоровье', level: 2, category_id: categories[0].id },
               { title: 'Особенности', level: 1, category_id: categories[1].id },
               { title: 'Виды', level: 2, category_id: categories[1].id }
])

questions = Question.create([
               { body: 'Самое большое животное жившее на земле?', test_id: tests[2].id },
               { body: 'способы укрепить эммунитет?', test_id: tests[1].id },
               { body: 'Самое быстрое животное жившее на земле из современных?', test_id: tests[2].id }
])

Answer.create!([
               { body: 'Слон', question_id: questions[0].id },
               { body: 'Дипладок', question_id: questions[0].id },
               { body: 'Синий кит', question_id: questions[0].id },
               { body: 'Брахиозавр', question_id: questions[0].id }
])

user = User.create(login: 'cool-net', password: 'my_password')

UserConnectionTest.create([
               { user_id: user.id, test_id: tests[0].id },
               { user_id: user.id, test_id: tests[1].id },
               { user_id: user.id, test_id: tests[2].id },
               { user_id: user.id, test_id: tests[3].id }
])
