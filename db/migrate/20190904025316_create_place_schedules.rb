class CreatePlaceSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :place_schedules do |t|
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.time :start
      t.time :end
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
