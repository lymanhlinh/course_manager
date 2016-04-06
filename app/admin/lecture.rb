ActiveAdmin.register Lecture do
  filter :email
  filter :description
  filter :first_name
  filter :last_name

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    column :description
    column :salary
    column :salary_period do |lecture|
      lecture.salary_period.titleize.capitalize
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :description
      f.input :salary
      f.input :salary_period, as: :select, collection: [:per_lesson, :per_course, :per_month].map { |e| [e.to_s.titleize, e] }, include_blank: true, prompt: "Select one period"
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :description
      row :salary
      row :salary_period do |lecture|
        lecture.salary_period.titleize.capitalize
      end
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  controller do
    def lecture_params
      params.require(:lecture).permit(:email, :password, :password, :password_confirmation, :first_name, :last_name, :description, :salary, :salary_period)
    end
  end
end
