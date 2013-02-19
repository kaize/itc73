class Firm < ActiveRecord::Base
  include FirmRepository

  attr_accessible :image, :name, :order_at, :url

  validates :name, presence: true, length: { maximum: 255 }
  validates :url, url: true, length: { maximum: 255 }

  mount_uploader :image, FirmImageUploader
  
  def can_destroy?
    persisted?
  end
end
