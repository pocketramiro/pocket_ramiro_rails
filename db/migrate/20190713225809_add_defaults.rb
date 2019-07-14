class AddDefaults< ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :active, true)
    change_column_default(:resources, :active, true)
    change_column_default(:resource_parts, :active, true)
    change_column_default(:parts, :active, true)
    change_column_default(:resource_types, :active, true)
    add_column :notes, :active, :boolean
    add_column :tickets, :active, :boolean
    change_column_default(:notes, :active, true)
    change_column_default(:tickets, :active, true)
  end
end
