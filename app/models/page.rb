class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :body, :slug, :name

  validates :name, presence: true, length: { maximum: 255 }

  def system_slug?
    configus.page_slugs.include? slug
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

end
