class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :foreign_key
      t.string :table_name
      t.references :user, foreign_key: true
      t.text :notes
      t.integer :priority
      t.string :frequency_unit
      t.integer :frequency_value
      t.timestamps
    end
  end
end
