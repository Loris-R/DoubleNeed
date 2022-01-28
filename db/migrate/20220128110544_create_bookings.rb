class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :double, null: false, foreign_key: true
      t.date :arrival_date
      t.date :departure_date
      t.integer :total_price
      t.integer :number_of_days
      t.string :status

      t.timestamps
    end
  end
end
