class Course < ActiveRecord::Base
  belongs_to :class_room
  belongs_to :creator, class_name: 'Staff'

  has_many :lessons, dependent: :destroy
  has_and_belongs_to_many :students
end
