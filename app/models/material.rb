class Material < ActiveRecord::Base
  include MaterialRepository

  attr_accessible :course, :course_id, :description, :name, :url

  validates :name, presence: true, length: { maximum: 255 }
  validates :url, url: true
end
