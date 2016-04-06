class AddPriceAndPricePeriodToClassRooms < ActiveRecord::Migration
  def change
    add_column :class_rooms, :price, :float
    add_column :class_rooms, :price_period, :integer
  end
end
