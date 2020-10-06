class AddDateToRoomtype < ActiveRecord::Migration[5.2]
  def change
    add_column :roomtypes, :dates, :string
  end
end
