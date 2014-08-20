class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.belongs_to :book
      t.integer :position
      t.date :date

      t.timestamps
    end
  end
end
