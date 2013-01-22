class UserPasswordEditType < User
  include BaseType

  validates :password, :presence => true, :confirmation => true
  
end
