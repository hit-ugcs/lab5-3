class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
