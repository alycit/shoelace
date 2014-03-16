class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :mentor_id
      t.integer :mentee_id

      t.timestamps
    end
  end
end
