class Organizer < ActiveRecord::Base
  include OrganizerRepository

  attr_accessible :image, :name, :order_at, :url

  validates :name, :presence=> true, :length => { :maximum => 255 }
  validates :url, :url => true, :format => {:with => /^(https?:\/\/)?([\w\.]+)\.([a-z]{2,6}\.?)(\/[\w\.]*)*\/?$/}
  mount_uploader :image, OrganizerImageUploader

  def can_destroy?
    persisted?
  end
end

