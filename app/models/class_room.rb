class ClassRoom < ActiveRecord::Base
  has_many :course_instances, dependent: :destroy

  validates :name, :price, :price_period, presence: true

  enum price_period: [:per_day, :per_month]
end
