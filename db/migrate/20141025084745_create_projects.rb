class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
