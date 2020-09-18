class CreateRoomtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :roomtypes do |t|
      t.integer :persons
      t.refereces :Hotel

      t.timestamps
    end
  end
end
