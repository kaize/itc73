class Course < ActiveRecord::Base
  include CourseRepository

  attr_accessible :description, :kind, :level, :name, :state, :state_event

  validates :name, presence: true, length: { maximum: 255 }

  state_machine :state, initial: :new do
    state :new
    state :published
    state :unpublished

    event :publish do
      transition any - [:published] => :published
    end

    event :unpublish do
      transition published: :unpublished
    end
  end

  def can_destroy?
    persisted?
  end
end
