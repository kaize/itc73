class Course < ActiveRecord::Base
  include CourseRepository

  define_index do
    indexes :name
    indexes :description

    has created_at
  end

  belongs_to :kind
  belongs_to :level

  has_many :materials, inverse_of: :course
  has_many :tasks, inverse_of: :course
  has_many :course_users
  has_many :users, :through => :course_users

  attr_accessible :description, :note, :kind, :kind_id, :level, :level_id, :name, 
    :state_event, :subscribe_state
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

  state_machine :subscribe_state, initial: :allowed do
    state :allowed
    state :denied
 
    event :allow do
      transition denied: :allowed
    end

    event :deny do
      transition allowed: :denied
    end
  end

  def can_destroy?
    persisted?
  end

  def to_s
    name
  end
end
