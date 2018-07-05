class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :book_suggestions do |t|
      t.string :editorial
      t.float :price
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :publisher
      t.string :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
