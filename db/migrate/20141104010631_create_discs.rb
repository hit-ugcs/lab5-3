class CreateDiscs < ActiveRecord::Migration
  def change
    create_table :discs do |t|
      t.integer :student_id
      t.decimal :score
      t.decimal :week1
      t.decimal :week2
      t.decimal :week3
      t.decimal :week4
      t.decimal :week5
      t.decimal :week6
      t.decimal :week7
      t.decimal :week8
      t.decimal :week9
      t.decimal :week10
      t.decimal :week11

      t.timestamps
    end
  end
end
