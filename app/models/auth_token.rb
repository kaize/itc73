class User::AuthToken < ActiveRecord::Base

  belongs_to :user

  validates :user, :presence => true
  validates :authentication_token, :presence => true, :uniqueness => true
  validates :expired_at, :presence => true

  def to_s
    authentication_token
  end

end