 class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :studentID
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.string :memo
      t.decimal :sum
      t.string :grade
      t.timestamps
    end
  end
end
