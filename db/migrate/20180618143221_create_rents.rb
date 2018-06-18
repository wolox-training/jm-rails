# frozen_string_literal: true

class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :from, null: false
      t.date :to, null: false

      t.timestamps
    end
  end
end
