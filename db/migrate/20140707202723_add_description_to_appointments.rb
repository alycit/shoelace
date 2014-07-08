class AddDescriptionToAppointments < ActiveRecord::Migration
  def up
    add_column :appointments, :description, :text
  end

  def down
    remove_column :appointments, :description, :text
  end
end
