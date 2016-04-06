class Lecture < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses, dependent: :destroy

  enum salary_period: [:per_lesson, :per_course, :per_month]

  def full_name
    "#{first_name} #{last_name}"
  end
end
