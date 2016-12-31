class CourseInstance < ActiveRecord::Base
  belongs_to :course
  belongs_to :class_room
  belongs_to :lecture

  has_many :lesson_instances, dependent: :destroy
  has_and_belongs_to_many :students
end
