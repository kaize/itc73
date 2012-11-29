module BaseRepository
  extend ActiveSupport::Concern

  included do
    include UsefullScopes
  end
end
