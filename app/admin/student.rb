ActiveAdmin.register Student do
  filter :email
  filter :full_name
  filter :birth_day
  filter :phone_number
  filter :description

  index do
    selectable_column
    column :id
    column :email
    column :full_name
    column :birth_day
    column :phone_number
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :full_name
      f.input :birth_day, as: :datepicker
      f.input :phone_number
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :full_name
      row :birth_day
      row :phone_number
      row :description
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
    def student_params
      params.require(:student).permit(:email, :password, :password, :password_confirmation, :full_name, :birth_day, :phone_number, :description)
    end
  end
end
