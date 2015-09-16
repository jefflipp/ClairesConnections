class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.integer :attend_id
      t.integer :attending_id

      t.timestamps null: false
    end
  add_index :attends, :attend_id
  add_index :attends, :attending_id
  add_index :attends, [:attend_id, :attending_id], unique: true
  end
end
