class AddTypeToAppointments < ActiveRecord::Migration
  def up
    add_column :appointments, :appt_type, :string
  end

  def down
    remove_column :appointments, :appt_type, :string
  end
end
