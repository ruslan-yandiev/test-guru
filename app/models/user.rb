# frozen_string_literal: true
require 'digest/sha1' # подключим на всякий случай, хотя по дефолту данная библиотека должна входить в пакет rails

class User < ApplicationRecord
  # # используется для соединения через соединительную таблицу (может быть без модели) многие ко многим
  # # где в промежуточной таблице будет только два атрибута(колонки) соединения:
  # # test_id и user_id
  # has_and_belongs_to_many :tests

  # также реализует многие ко многим но только через промежуточную модель и таблицу
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, format: { with: /\A[\w.-]+@[\w.-]+\.[\w.-]+\z/ }, uniqueness: true

  # специальный метод подключаемый из gem 'bcrypt'
  # он добавляет ряд валидаций, метод authenticate и еще пару полезных методов
  # но использует библиотеку BCrypt
  has_secure_password

  def tests_list(value_level)
  	tests.where(level: value_level)
  end

  def test_passage(test)
    # найдем тот объект test_passages который соответствует конкретному тесту
    # но для начала отсортируем объекты в обратном порядке, чтобы получить самый последний из созданных.
    # test_passages.order(id: :desc).find_by(test_id: test.id)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
