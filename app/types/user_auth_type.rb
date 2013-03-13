class UserAuthType < User
  include BaseType

  attr_accessible :personal_data_processing

  validates :password, presence: true
  validates :birthday, presence: true
  validates :university, presence: true, length: { maximum: 255 }
  validates :edu_year_end, presence: true
end
