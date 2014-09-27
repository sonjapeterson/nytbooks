class AddBookCountToAuthors < ActiveRecord::Migration
  def up
    add_column :authors, :books_count, :integer, default: 0, null: false

    Author.find_each do |result|
      Author.reset_counters(result.id, :books)
    end
  end

  def down
    remove_column :authors, :books_count
  end
end
