ActiveAdmin.register ClassRoom do
  index do
    selectable_column
    column :name
    column :description
    column :price do |record|
      currency_format(record.price)
    end
    column :price_period do |record|
      record.price_period.titleize.capitalize
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :price_period, as: :select, collection: [:per_day, :per_month].map { |e| [e.to_s.titleize, e] }, include_blank: true, prompt: "Select one period"
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price do |record|
        currency_format(record.price)
      end
      row :price_period do |record|
        record.price_period.titleize.capitalize
      end
      row :created_at
      row :updated_at
    end
  end


  controller do
    def class_room_params
      params.require(:class_room).permit(:name, :description, :price, :price_period)
    end
  end
end
