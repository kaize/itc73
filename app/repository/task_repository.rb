module TaskRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :published, with_state(:published)
  end
end


