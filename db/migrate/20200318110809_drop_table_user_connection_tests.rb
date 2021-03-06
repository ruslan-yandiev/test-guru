# frozen_string_literal: true

class DropTableUserConnectionTests < ActiveRecord::Migration[6.0]
  def up
    # удалим ненужную таблицу и на всякий случай укажем опцию if_exists: true
    # чтобы исключить ошибки если вдруг мы будем накатывать и откатывать миграцию
    # много раз и если при накате миграции таблицу уже нет, мы не получим ошибку
    # Правда я дропнул базу, удалил модель с миграцией и связанные с ней миграции,
    # но так делать нельзя.
    drop_table :user_connection_tests, if_exists: true
  end
end
