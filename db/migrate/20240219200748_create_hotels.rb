class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.string :owner
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
