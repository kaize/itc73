module Course::KindRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :with_courses, -> { joins(:courses).merge(Course.published).uniq.asc_by_order_at }
  end
end

