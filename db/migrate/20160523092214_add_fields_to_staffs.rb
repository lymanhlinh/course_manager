class AddFieldsToStaffs < ActiveRecord::Migration
  def change
    add_attachment :staffs, :avatar
    add_column :staffs, :birth_day, :date
    add_column :staffs, :phone_number, :string
  end
end
