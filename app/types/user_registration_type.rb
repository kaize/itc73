class UserRegistrationType < User
  include BaseType

  validates :password_confirmation, presence: true
  validates :personal_data_processing, acceptance: { accept: true, allow_nil: false }
  validates :birthday, presence: true
  validates :university, presence: true, length: { maximum: 255 }
  validates :edu_year_end, presence: true
  validates :graduate_id, presence: true
end
