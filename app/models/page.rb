class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :body, :slug, :name, :state_event

  validates :name, presence: true, length: { maximum: 255 }
  validates :slug, slug: true, uniqueness: true, length: { maximum: 255 }
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
  def system_slug?
    slug && configus.page_slugs.include?(slug.to_sym)
  end

  def can_destroy?
    persisted? && !system_slug?
  end

  class << self
    configus.page_slugs.each do |slug|
      define_method slug do
        find_by_slug slug
      end
    end
  end

  def slug=(value)
    value = Support::SlugGenerator.generate(name) unless value.present?
    write_attribute(:slug, value)
  end

  def to_param
    slug
  end

end
