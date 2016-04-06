class ClassRoom < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  validates :name, :price, :price_period, presence: true

  enum price_period: [:per_day, :per_month]
end
