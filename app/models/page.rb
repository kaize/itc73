class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :content, :slug, :title

  validates :title, presence: true, length: { maximum: 255 }

  def configured_slug?
    configus.page_slugs.include? slug
  end

  def can_destroy?
    persisted? && !configured_slug?
  end

  class << self
    configus.page_slugs.each do |slug|
      define_method slug do
        find_by_slug slug
      end
    end
  end

end
