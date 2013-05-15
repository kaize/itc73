module UserRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :active, where(state: :active)
  end
end


