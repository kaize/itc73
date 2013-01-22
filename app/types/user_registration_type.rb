class UserRegistrationType < User
  include BaseType

  attr_accessible :personal_data_processing

  validates :password, presence: true, :confirmation => true
  validates :personal_data_processing, acceptance: { accept: "1", allow_nil: false }
  validates :birthday, presence: true
  validates :university, presence: true, length: { maximum: 255 }
  validates :edu_year_end, presence: true
  #validates :graduate, presence: true #пока в БД нет уровней образования
end
