class CreateScoreUpdates < ActiveRecord::Migration
  def change
    create_table :score_updates do |t|
      t.integer :studentid
      t.string :tablename
      t.string :fieldname

      t.timestamps
    end
  end
end
