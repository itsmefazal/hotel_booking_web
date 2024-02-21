class CreateRoomCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :room_categories do |t|
      t.string :name
      t.integer :capacity
      t.float :price
      t.text :facilities

      t.timestamps
    end
  end
end
