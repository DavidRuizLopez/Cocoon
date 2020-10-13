class CreateRoomtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :roomtypes do |t|
      t.integer :persons
      t.references :hotel, foreign_key: true
      t.string :dates

      t.timestamps
    end
  end
end
