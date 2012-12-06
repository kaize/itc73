class Course::Level < ActiveRecord::Base
  include Course::LevelRepository

  attr_accessible :name

  validates :name, presence: true, length: { maximum: 255 }

  def can_destroy?
    persisted?
  end

  def to_s
    name
  end
end
