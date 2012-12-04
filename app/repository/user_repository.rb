module UserRepository
  extend ActiveSupport::Concern

  included do
    include BaseRepository

    scope :active, where(state: :active)
  end
end


