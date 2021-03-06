class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :table_key
      t.string :table_name
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
