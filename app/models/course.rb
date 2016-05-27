class Course < ActiveRecord::Base
  belongs_to :class_room
  belongs_to :staff

  has_many :lessons, dependent: :destroy
  has_and_belongs_to_many :students

  accepts_nested_attributes_for :lessons

  validates :name, :class_room, :staff, :start_date, :end_date, :max_num_of_students, :price, presence: true

  scope :created_by, -> (staff) { where(staff: staff) }
  scope :not_created_by, -> (staff) { where.not(staff: staff) }
end
