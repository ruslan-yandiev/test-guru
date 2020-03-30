class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
        :registerable,
        :recoverable, 
        :rememberable,
        :trackable,
        :validatable,
        :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

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
