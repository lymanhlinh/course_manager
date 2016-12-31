class CreateCourseInstances < ActiveRecord::Migration
  def change
    create_table :course_instances do |t|
      t.date :start_date
      t.date :end_date
      t.integer :max_num_of_students
      t.references :lecture, index: true
      t.references :class_room, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
  end
end
