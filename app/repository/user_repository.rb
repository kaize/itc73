module UserRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :active, where(state: :active)

    def self.universities_by_term(university = nil)
      if university
        self.like_by_university(university).pluck(:university).uniq
      else
        self.pluck(:university).uniq
      end
    end
  end
end


