class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :list
      t.string :title
      t.string :author
      t.string :publisher
      t.text :description
      t.integer :isbn
      t.decimal :price
      t.string :book_review_link
      t.string :sunday_review_link
      t.string :book_image

      t.timestamps
    end
  end
end
