class RemoveStartDateAndEndDateAndMaxNumOfStudentsAndLectureAndClassRoomFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :start_date, :date
    remove_column :courses, :end_date, :date
    remove_column :courses, :max_num_of_students, :integer

    change_table :courses do |t|
      t.remove_index column: :lecture_id
      t.remove_index column: :class_room_id
      t.remove_references :lecture
      t.remove_references :class_room
    end
  end
end
