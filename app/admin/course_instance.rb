ActiveAdmin.register CourseInstance do
  filter :course
  filter :class_room
  filter :lecture
  filter :start_date
  filter :end_date

  index do
    selectable_column
    column :course
    column :class_room
    column :start_date
    column :end_date
    column 'Maximum number of students', :max_num_of_students
    actions
  end

  form do |f|
    f.inputs do
      f.input :course, prompt: 'Select one course'
      f.input :class_room, prompt: 'Select one class room'
      f.input :lecture, prompt: 'Select one lecture'
      f.input :start_date, as: :datepicker
      f.input :end_date, as: :datepicker
      f.input :max_num_of_students, label: 'Maximum number of students'
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :course
      row :class_room
      row :lecture
      row :start_date
      row :end_date
      row 'Maximum number of students' do |record|
        record.max_num_of_students
      end
      row :created_at
      row :updated_at
    end
  end

  controller do
    def course_params
      params.require(:course).permit(:course_id, :class_room_id, :start_date, :end_date, :max_num_of_students)
    end
  end

end
