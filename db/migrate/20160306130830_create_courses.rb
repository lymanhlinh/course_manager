class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.integer :max_num_of_students
      t.references :lecture, index: true
      t.references :class_room, index: true
      t.references :redactor, index: true

      t.timestamps null: false
    end
  end
end
