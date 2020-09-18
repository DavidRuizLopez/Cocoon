class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :normalPrice
      t.integer :discountPrice
      t.text :description
      t.references :Category

      t.timestamps
    end
  end
end
