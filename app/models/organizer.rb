class Organizer < ActiveRecord::Base
  include OrganizerRepository

  attr_accessible :image, :name, :order_at, :url

  validates :name, presence: true, length: { maximum: 255 }
  validates :url, :url => {:allow_blank => true, :message => "Uri is not valid"}, :length => { :maximum =>255 }
  mount_uploader :image, OrganizerImageUploader

  def can_destroy?
    persisted?
  end
end

