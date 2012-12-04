class News < ActiveRecord::Base
  include NewsRepository

  attr_accessible :body, :image, :name, :published_at, :state, :state_event

  validates :name, presence: true, length: { maximum: 255 }
  validates :published_at, presence: true

  mount_uploader :image, NewsImageUploader

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
