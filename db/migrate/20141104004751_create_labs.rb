class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.integer :student_id
      t.decimal :score
      t.decimal :lab1
      t.decimal :lab2
      t.decimal :lab3
      t.decimal :lab4
      t.decimal :lab5
      t.decimal :lab6
      t.decimal :lab7

      t.timestamps
    end
  end
end
