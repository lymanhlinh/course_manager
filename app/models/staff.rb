class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:creator, :accountant, :human_resource_manager]
  enum salary_period: [:per_day, :per_month]

  has_attached_file :avatar, styles: { large: "400x400>", medium: "200x200>", small: "100x100>", thumb: "40x40>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  has_many :courses, dependent: :destroy

  def s3_credentials
    {:bucket => "linhly", :access_key_id => ENV['s3_access_key_id'], :secret_access_key => ENV['s3_secret_access_key']}
  end

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def full_name
    "#{first_name} #{last_name}"
  end
end
