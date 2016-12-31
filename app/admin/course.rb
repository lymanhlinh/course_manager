ActiveAdmin.register Course do
  filter :name
  filter :staff, label: 'Creator'
  filter :name
  filter :description

  index do
    selectable_column
    column :name
    column 'Creator', :staff
    column :description
    column :price do |record|
      currency_format(record.price)
    end
    column :lessons do |record|
      record.lessons.map do |lesson|
        auto_link(lesson, "#{lesson.index}: #{lesson.name}" )
      end.join(', ').html_safe
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :staff, prompt: 'Select one staff', label: 'Creator'
      f.input :description
      f.input :price
      f.inputs do
        f.has_many :lessons, new_record: 'Add Lesson', allow_destroy: true do |l|
          l.input :index
          l.input :name
          l.input :description
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row 'Creator' do |record|
        record.staff
      end
      row :description
      row :price do |record|
        currency_format(record.price)
      end
      row :lessons do |record|
        record.lessons.map do |lesson|
          auto_link(lesson, "#{lesson.index}: #{lesson.name}" )
        end.join(', ').html_safe
      end
      row :created_at
      row :updated_at
    end
  end

  controller do
    def course_params
      params.require(:course).permit(:staff_id, :name, :description, :price, lessons_attributes: [:id, :index, :name, :description])
    end
  end

end
