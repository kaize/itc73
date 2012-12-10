class Task < ActiveRecord::Base
  include TaskRepository

  belongs_to :course

  has_many :files

  attr_accessible :course, :course_id, :description, :name, :url, :state, :state_event,
    :files_attributes

  validates :name, presence: true, length: { maximum: 255 }
  validate :url, url: true, allow_blank: true

  accepts_nested_attributes_for :files, allow_destroy: true, reject_if: :all_blank

  state_machine :state, initial: :new do
    state :new
    state :published
    state :unpublished

    event :publish do
      transition any - :published => :published
    end

    event :unpublish do
      transition published: :unpublished
    end
  end

  def can_destroy?
    persisted?
  end
end
