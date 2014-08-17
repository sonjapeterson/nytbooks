class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.belongs_to :book
      t.date :date
      t.integer :rank
    end
  end
end
