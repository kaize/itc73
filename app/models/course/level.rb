class Course::Level < ActiveRecord::Base
  include Course::LevelRepository

  has_many :courses, :dependent => :restrict

  attr_accessible :name, :order_at

  validates :name, presence: true, length: { maximum: 255 }

  def can_destroy?
    persisted?
  end

  def to_s
    name
  end
end
