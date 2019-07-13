class CreateResourceParts < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_parts do |t|
      t.references :part, foreign_key: true
      t.references :resource, foreign_key: true
      t.boolean :active
      t.timestamps
    end
  end
end
