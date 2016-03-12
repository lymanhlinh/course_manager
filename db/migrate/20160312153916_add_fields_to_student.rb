class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :full_name, :string
    add_column :students, :birth_day, :date
    add_column :students, :phone_number, :string
  end
end
