class Test < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :user_connection_tests, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :user_connection_tests

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true }, allow_nil: true#, if: :ruby_test?

  validate :validate_max_level, on: :create

  scope :easy, -> (level) { where(level: level) }
   
  # def self.sort_names_by_category(name_category)
  #   joins('JOIN categories ON categories.id = tests.category_id')
  #   .where(categories: { title: name_category })
  # end

  # def self.sort_names_by_category(name_category)
  #   joins(:category).where(categories: { title: name_category })
  # end

  scope :sort_names_by_category, lambda { |name_category| joins(:category).where(categories: { title: name_category }) }

  private

  def validate_max_level
  	errors.add(:level) if level.to_i > 10
  end

  # def ruby_test?
  # 	title.match(/Ruby/i)
  # end
end
