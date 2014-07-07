class AddDescriptionToUsers < ActiveRecord::Migration
  def up
    add_column :users, :description, :text
  end

  def down
    remove_column :users, :description, :text
  end
end
