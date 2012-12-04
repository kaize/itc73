class UserDecorator < Draper::Base
  decorates :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def email_to
    "#{full_name} <#{email}>"
  end

  def to_s
    full_name
  end
end
