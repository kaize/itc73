class User < ActiveRecord::Base
  include UserRepository

  has_secure_password

  attr_accessible :birthday, :education, :email, :first_name, :last_name,
    :password, :phone, :state, :admin

  validates :email, email: true
  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }
  validates :education, length: { maximum: 255 }

  state_machine :state, initial: :new do
    state :new
    state :active
    state :inactive

    event :activate do
      transition any - :active => :active
    end

    event :deactivate do
      transition :active => :inactive
    end
  end
end

