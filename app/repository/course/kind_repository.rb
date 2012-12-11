module Course::KindRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :with_courses, -> { joins(:courses).merge(Course.published).uniq }
  end
end

