# frozen_string_literal: true

user = User.create!(email: 'cool-net@yandex.ru', password: 'my_password')

user2 = User.create!(email: 'cool-net2@yandex.ru', password: 'my_password2')

User.all.each { |u| u.update(type: 'Admin') }

categories = Category.create!([{ title: 'Люди' }, { title: 'Животные' }])

tests = Test.create!([
               { title: 'Образование', level: 1, category: categories[0], author: user2 },
               { title: 'Здоровье', level: 2, category: categories[0], author: user2 },
               { title: 'Особенности', level: 1, category: categories[1], author: user },
               { title: 'Виды', level: 2, category: categories[1], author: user }
])

questions = Question.create([
               { body: 'Самое большое животное жившее на земле?', test: tests[2] },
               { body: 'Способы укрепить эммунитет?', test: tests[1] },
               { body: 'Самое быстрое животное жившее на земле из современных?', test: tests[2] },
               { body: 'Сколько вешать в граммах?', test: tests[2] },
               { body: 'Самая маленькая птица?', test: tests[2] }
])

Answer.create!([
               { body: 'Слон', question: questions[0] },
               { body: 'Дипладок', question: questions[0] },
               { body: 'Синий кит', question: questions[0], correct: true },
               { body: 'Брахиозавр', question: questions[0] },

               { body: 'Слон', question: questions[2] },
               { body: 'Шатландский Говнодав', question: questions[2] },
               { body: 'Гепард', question: questions[2], correct: true },
               { body: 'Тёща', question: questions[2] },

               { body: '100 грамм', question: questions[3] },
               { body: '200 грамм', question: questions[3] },
               { body: 'В граммах лучше не вешать', question: questions[3] },
               { body: 'Вопрос не имеет смысла', question: questions[3], correct: true  },
               
               { body: 'Колибри', question: questions[4], correct: true },
               { body: 'Сеница', question: questions[4] },
               { body: 'Короткоклювка', question: questions[4] },
               { body: 'Все птицы маленькие', question: questions[4] }
])

TestPassage.create([
               { user: user, test: tests[0] },
               { user: user, test: tests[1] },
               { user: user, test: tests[2] },
               { user: user, test: tests[3] }
])

Test.create!( title: 'existing test', category: categories[1], author: user)

Test.create!(title: 'does_not_have_a_category', author: User.find_by(email: 'cool-net2@yandex.ru'))