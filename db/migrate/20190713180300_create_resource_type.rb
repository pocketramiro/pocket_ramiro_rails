class CreateResourceType < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_types do |t|
      t.string :category
      t.string :company
      t.biginteger :contact_number
      t.string :contact_name
      t.text :manual_url
      t.boolean :active
      t.timestamps
    end
  end
end
