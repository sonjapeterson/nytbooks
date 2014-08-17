class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.string :author
      t.string :publisher
      t.decimal :price
      t.text :description
      t.string :book_review_link
      t.string :sunday_review_link
    end
  end
end
