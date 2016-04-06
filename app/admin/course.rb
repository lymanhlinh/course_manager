ActiveAdmin.register Course do
  filter :name
  filter :class_room
  filter :staff, label: 'Creator'
  filter :lecture
  filter :name
  filter :description
  filter :start_date
  filter :end_date

  index do
    selectable_column
    column :name
    column :class_room
    column 'Creator', :staff
    column :lecture
    column :description
    column :start_date
    column :end_date
    column 'Maximum number of students', :max_num_of_students
    column :price do |record|
      currency_format(record.price)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :class_room, prompt: 'Select one class room'
      f.input :staff, prompt: 'Select one staff', label: 'Creator'
      f.input :lecture, prompt: 'Select one lecture'
      f.input :description
      f.input :start_date
      f.input :end_date
      f.input :max_num_of_students, label: 'Maximum number of students'
      f.input :price
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :class_room
      row 'Creator' do |record|
        record.staff
      end
      row :lecture
      row :description
      row :start_date
      row :end_date
      row 'Maximum number of students' do |record|
        record.max_num_of_students
      end
      row :price do |record|
        currency_format(record.price)
      end
      row :created_at
      row :updated_at
    end
  end

  controller do
    def course_params
      params.require(:course).permit(:class_room_id, :staff_id, :lecture_id, :name, :description, :start_date, :end_date, :max_num_of_students, :price)
    end
  end

end
