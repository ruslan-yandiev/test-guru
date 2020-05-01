# frozen_string_literal: true

class Test < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  # реализует многие ко многим но только через промежуточную модель и таблицу
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 } # , if: :ruby_test?
  validate :validate_max_level, on: :create

  scope :easy, ->(level) { where(level: level) }
  scope :lite, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, -> (level) { where(level: level) }
  scope :sort_names_by_category, ->(name_category) { joins(:category).where(categories: { title: name_category }) }

  private

  def self.names_by_category(name_category)
    sort_names_by_category(name_category).pluck(:title)
  end

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end

  # Условная валидация
  # def ruby_test?
  #   title.match(/Ruby/i)
  # end
end
