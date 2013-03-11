class UserAuthorizationType < User
  include BaseType

  attr_accessible :personal_data_processing

  validates :birthday, presence: true
  validates :university, presence: true, length: { maximum: 255 }
  validates :edu_year_end, presence: true
  #validates :graduate, presence: true #пока в БД нет уровней образования
end
