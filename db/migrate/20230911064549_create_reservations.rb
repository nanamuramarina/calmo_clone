class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :customer_id, null: false
      t.integer :menu_id, null: false
      t.integer :payment_method, null: false
      t.date :start_reservation_date, null: false
      t.string :start_reservation_time, null: false
      t.date :end_reservation_date, null: false
      t.string :end_reservation_time, null: false
      t.integer :number, null: false
      t.integer :billing_fee, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
