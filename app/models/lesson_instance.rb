class LessonInstance < ActiveRecord::Base
  belongs_to :course_instance
  belongs_to :lesson
end
