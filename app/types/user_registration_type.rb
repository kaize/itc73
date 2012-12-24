class UserRegistrationType < User
  include BaseType

  attr_accessible :password_confirmation, :personal_data_processing

  validates :password_confirmation, presence: true
  validates :personal_data_processing, acceptance: { accept: "1", allow_nil: false }
  validates :birthday, presence: true
  validates :university, presence: true, length: { maximum: 255 }
  validates :edu_year_end, presence: true
  #validates :graduate, presence: true #пока в БД нет уровней образования
end
