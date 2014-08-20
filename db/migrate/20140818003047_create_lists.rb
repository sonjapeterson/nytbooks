class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :length
      t.string :updated

      t.timestamps
    end
  end
end
