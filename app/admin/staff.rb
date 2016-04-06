ActiveAdmin.register Staff do
  filter :email
  filter :role, as: :select, collection: [:creator, :accountant, :human_resource_manager].each_with_index.map { |e, i| [e.to_s.titleize, i] }, include_blank: true
  filter :description
  filter :first_name
  filter :last_name

  index do
    selectable_column
    column :email
    column :role do |record|
      record.role.titleize
    end
    column :first_name
    column :last_name
    column :description
    column :salary do |record|
      currency_format(record.salary)
    end
    column :salary_period do |record|
      record.salary_period.titleize.capitalize
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: [:creator, :accountant, :human_resource_manager].map { |e| [e.to_s.titleize, e] }, include_blank: true, prompt: "Select one role"
      f.input :first_name
      f.input :last_name
      f.input :description
      f.input :salary
      f.input :salary_period, as: :select, collection: [:per_day, :per_month].map { |e| [e.to_s.titleize, e] }, include_blank: true, prompt: "Select one period"
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :role do |record|
        record.role.titleize
      end
      row :description
      row :salary do |record|
        currency_format(record.salary)
      end
      row :salary_period do |record|
        record.salary_period.titleize.capitalize
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
    def staff_params
      params.require(:staff).permit(:email, :password, :password, :password_confirmation, :role, :first_name, :last_name, :description, :salary, :salary_period)
    end
  end
end
