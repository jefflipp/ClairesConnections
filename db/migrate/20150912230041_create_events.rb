class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :for_ages

      t.timestamps null: false
    end
  end
end
