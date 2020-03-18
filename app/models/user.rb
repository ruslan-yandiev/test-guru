# frozen_string_literal: true

class User < ApplicationRecord
  # # используется для соединения через соединительную таблицу (может быть без модели) многие ко многим
  # # где в промежуточной таблице будет только два атрибута(колонки) соединения:
  # # test_id и user_id
  # has_and_belongs_to_many :tests

  # также реализует многие ко многим но только через промежуточную модель и таблицу
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :existing_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 5 }

  def tests_list(value_level)
  	tests.where(level: value_level)
  end

  def test_passage(test)
    # найдем тот объект test_passages который соответствует конкретному тесту
    # но для начала отсортируем объекты в обратном порядке, чтобы получить самый последний из созданных.
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
