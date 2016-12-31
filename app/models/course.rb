class Course < ActiveRecord::Base
  belongs_to :class_room
  belongs_to :staff

  has_many :lessons, dependent: :destroy
  has_many :course_instances, dependent: :destroy

  accepts_nested_attributes_for :lessons

  validates :name, :staff, :price, presence: true

  scope :created_by, -> (staff) { where(staff: staff) }
  scope :not_created_by, -> (staff) { where.not(staff: staff) }
end
