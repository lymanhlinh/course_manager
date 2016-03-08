class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
