class CreateFinals < ActiveRecord::Migration
  def change
    create_table :finals do |t|
      t.decimal :score
      t.integer :student_id

      t.timestamps
    end
  end
end
