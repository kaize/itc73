class Task < ActiveRecord::Base
  include TaskRepository

  attr_accessible :course, :course_id, :description, :file, :name, :url

  validates :name, presence: true, length: { maximum: 255 }
  validate :url, url: true, allow_blank: true

  def can_destroy?
    persisted?
  end
end
