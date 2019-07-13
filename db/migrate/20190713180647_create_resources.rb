class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :resource_type, foreign_key: true
      t.string :name
      t.float :cost
      t.references :users, foreign_key: true
      t.boolean :active
      t.timestamps
    end
  end
end
