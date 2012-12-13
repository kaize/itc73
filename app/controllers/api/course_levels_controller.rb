class Api::CourseLevelsController < Api::ApplicationController
  def mass_update_order
    level_ids = params[:ids]
    levels = Course::Level.find(level_ids)

    level_ids.map!(&:to_i);

    levels.each do |level|
      order = level_ids.index(level.id)
      level.update_attribute :order_at, order
    end

    head :ok
  end
end
