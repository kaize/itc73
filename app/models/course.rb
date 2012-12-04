class Course < ActiveRecord::Base
  attr_accessible :description, :kind, :level, :name, :state, :state_event

  validates :name, presence: true, length: { maximum: 255 }

  state_machine :state, initial: :new do
    state :new
    state :published
    state :hidden

    event :publish do
      transition any - [:published] => :published
    end

    event :unpublish do
      transition published: :hidden
    end
  end

  def can_destroy?
    persisted?
  end
end
