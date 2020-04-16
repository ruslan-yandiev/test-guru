# frozen_string_literal: true

class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      # укажем связь атрибута(колонки) с таблицей questions foreign_key: { to_table: :questions }
      # почему то не может найти связть при миграции если просто указать foreign_key: true, хотя в модели принадлежность
      # и связь указаны как и у User и Test, возможно дело в том, что в модели Question не реализована
      # связь многие ко многим как в моделях User и Test друг с другом через модель TestPassage
      t.references :current_question, foreign_key: { to_table: :questions }

      # добавим дефолтное значение в ноль, так как пока у нас нет ни одного правильной пройдетнного теста.
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
