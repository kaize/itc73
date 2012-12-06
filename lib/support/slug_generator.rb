class Support::SlugGenerator
  class << self
    def generate(base)
      Russian.translit(base).downcase.gsub(/(\W+)/, "-").chomp("-") if base.present?
    end
  end
end
