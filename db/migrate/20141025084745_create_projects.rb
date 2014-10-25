class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.decimal :score
      t.integer :student_id
      
      t.timestamps
    end
  end
end
