class NewsDecorator < Draper::Base
  decorates :news

  def description
    description = h.strip_tags body
    "#{description[0..200]}#{'...' if description.length > 200}"
  end

  def date
    h.l published_at, format: :only_date
  end
end
