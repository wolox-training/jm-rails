class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :Genre, null: false
      t.string :Author, null: false
      t.string :Image, null: false
      t.string :Title, null: false
      t.string :Publisher, null: false
      t.string :Year, null: false

      t.timestamps
    end
  end
end
