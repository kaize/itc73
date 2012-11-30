module PageRepository
  extend ActiveSupport::Concern

  included do
    include BaseRepository
  end
end


