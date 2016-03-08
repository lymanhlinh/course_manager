class Lesson < ActiveRecord::Base
  belongs_to :course

  has_many :lesson_videos, dependent: :destroy
end
