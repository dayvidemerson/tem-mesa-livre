class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :description
      t.string :street
      t.string :city
      t.string :state
      t.integer :number_of_tables
      t.integer :number_of_chairs
      t.decimal :price_per_hour, precision: 10, scale: 2
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
