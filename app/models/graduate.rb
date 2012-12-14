class Graduate < ActiveRecord::Base
  include GraduateRepository

  has_many :users

  attr_accessible :name

  validates :name, presence: true, length: { maximum: 255 }

  def can_destroy?
    persisted?
  end
end
