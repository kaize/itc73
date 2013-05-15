module TaskRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :published, ->{where(state: :published)}
  end
end


