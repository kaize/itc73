module PageRepository
  extend ActiveSupport::Concern

  included do
    include BaseRepository
    scope :published, where(state: :published)
  end
end


