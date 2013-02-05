class NewsDecorator < Draper::Base
  decorates :news

  def description
    name = Sanitize.clean(name)
    description = Sanitize.clean(body.gsub(/(&nbsp;|\s)+/, " "))
    "#{description[0..200]}#{'...' if description.length > 200}"
  end

  def date
    h.l published_at, format: :only_date
  end
end
