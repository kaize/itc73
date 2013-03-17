module Course::LevelRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :with_kind, ->kind { includes(:courses).where({ courses: { kind_id: kind } }).asc_by_order_at }
  end
end


