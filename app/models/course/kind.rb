class Course::Kind < ActiveRecord::Base
  include Course::KindRepository

  attr_accessible :name

  validates :name, presence: true, length: { maximum: 255 }

  def can_destroy?
    persisted?
  end
end
