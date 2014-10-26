class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.decimal :score
      t.integer :iteNum
      t.integer :student_id
      t.integer :project_id
      
      t.timestamps
    end
  end
end
