class User < ActiveRecord::Base
  include UserRepository

  has_secure_password

  belongs_to :graduate
  has_many :course_users
  has_many :courses, :through => :course_users

  attr_accessible :birthday, :university, :edu_year_end, :graduate, :graduate_id, :email,
    :first_name, :last_name, :patronymic, :password, :phone, :state, :subscribe_state, :admin, 
    :workplace

  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :password, presence: true, on: :create
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :patronymic, length: { maximum: 255 }
  validates :education, length: { maximum: 255 }
  validates :workplace, length: { maximum: 255 }

  state_machine :state, initial: :new do
    state :new
    state :active
    state :inactive

    event :activate do
      transition any - :active => :active
    end

    event :deactivate do
      transition :active => :inactive
    end
  end

  def guest?
    false
  end

  class << self
    def birthday_year_min
      Date.today.year - 90
    end

    def birthday_year_max
      Date.today.year - 10
    end
  end

end

