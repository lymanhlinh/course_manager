class CreateLessonInstances < ActiveRecord::Migration
  def change
    create_table :lesson_instances do |t|
      t.date :start_date
      t.date :end_date
      t.references :lecture, index: true
      t.references :class_room, index: true
      t.references :course_instance, index: true
      t.references :lesson, index: true

      t.timestamps null: false
    end
  end
end
